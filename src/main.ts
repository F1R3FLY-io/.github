import { SVG_CONTENT_INSET, computeSvgContentWidth } from "./layout";
import { loadNarrativeConfig, type SpeedTrack } from "./narratives";
import { SVGAnimationPlayer } from "./player";
import { getStageAtTime } from "./stages";
import { DEFAULT_SPEED_LEVEL } from "./speeds";
import { NarrationPlayer } from "./tts";
import "./index.css";

const FALLBACK_SVG = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 520" role="img" aria-label="Missing explainer animation">
	<rect x="10" y="10" width="780" height="500" rx="16" fill="#101f30" stroke="#3a4f70" stroke-width="2"/>
	<text x="400" y="220" text-anchor="middle" fill="#f4b942" font-size="30" font-family="IBM Plex Sans, sans-serif">F1R3FLY Explainer Scaffold</text>
	<text x="400" y="265" text-anchor="middle" fill="#b7c8df" font-size="18" font-family="IBM Plex Sans, sans-serif">Missing docs/images/F1r3fly_explainer.svg</text>
	<text x="400" y="298" text-anchor="middle" fill="#8fa4c0" font-size="14" font-family="IBM Plex Sans, sans-serif">Add your SMIL SVG in a later step.</text>
</svg>`;

function formatTime(seconds: number): string {
	const m = Math.floor(seconds / 60);
	const s = Math.floor(seconds % 60);
	return `${m}:${s.toString().padStart(2, "0")}`;
}

function requireElement<T extends HTMLElement>(id: string): T {
	const el = document.getElementById(id);
	if (!el) {
		throw new Error(`Missing required element: #${id}`);
	}
	return el as T;
}

function isLightMode(): boolean {
	return document.documentElement.classList.contains("light");
}

function initThemeToggle() {
	let toggle: HTMLButtonElement;
	try {
		toggle = requireElement<HTMLButtonElement>("theme-toggle");
	} catch {
		return;
	}
	const root = document.documentElement;

	function updateTooltip() {
		toggle.title = isLightMode() ? "Switch to dark mode" : "Switch to light mode";
	}

	if (localStorage.getItem("f1r3fly-theme") === "light") {
		root.classList.add("light");
	}
	updateTooltip();

	toggle.addEventListener("click", () => {
		root.classList.toggle("light");
		localStorage.setItem("f1r3fly-theme", root.classList.contains("light") ? "light" : "dark");
		updateTooltip();
	});
}

async function loadSvgMarkup(): Promise<string> {
	try {
		const response = await fetch("/F1r3fly_explainer.svg");
		if (!response.ok) return FALLBACK_SVG;
		return await response.text();
	} catch {
		return FALLBACK_SVG;
	}
}

async function init() {
	let svgContainer: HTMLElement;
	try {
		svgContainer = requireElement<HTMLElement>("svg-container");
	} catch {
		return;
	}

	const [svgText, narrativeConfig] = await Promise.all([loadSvgMarkup(), loadNarrativeConfig()]);
	svgContainer.innerHTML = svgText;

	let svg = svgContainer.querySelector("svg") as SVGSVGElement | null;
	if (!svg) {
		svgContainer.innerHTML = FALLBACK_SVG;
		svg = svgContainer.querySelector("svg") as SVGSVGElement | null;
	}
	if (!svg) return;
	const svgEl = svg;

	let playPauseBtn: HTMLButtonElement;
	let timeline: HTMLInputElement;
	let timeDisplay: HTMLElement;
	let speedSlider: HTMLInputElement;
	let speedLabel: HTMLElement;
	let narrativeText: HTMLElement;
	let stageLabel: HTMLElement;
	let stageButtonsContainer: HTMLElement;
	let speedDown: HTMLButtonElement;
	let speedUp: HTMLButtonElement;
	let muteBtn: HTMLButtonElement;
	let transport: HTMLElement;
	let resizeHandle: HTMLElement;
	let narrativeBox: HTMLElement;
	let mainArea: HTMLElement;

	try {
		playPauseBtn = requireElement<HTMLButtonElement>("play-pause");
		timeline = requireElement<HTMLInputElement>("timeline");
		timeDisplay = requireElement<HTMLElement>("time-display");
		speedSlider = requireElement<HTMLInputElement>("speed-slider");
		speedLabel = requireElement<HTMLElement>("speed-label");
		narrativeText = requireElement<HTMLElement>("narrative-text");
		stageLabel = requireElement<HTMLElement>("stage-label");
		stageButtonsContainer = requireElement<HTMLElement>("stage-buttons");
		speedDown = requireElement<HTMLButtonElement>("speed-down");
		speedUp = requireElement<HTMLButtonElement>("speed-up");
		muteBtn = requireElement<HTMLButtonElement>("mute-btn");
		transport = requireElement<HTMLElement>("transport");
		resizeHandle = requireElement<HTMLElement>("resize-handle");
		narrativeBox = requireElement<HTMLElement>("narrative-box");
		mainArea = requireElement<HTMLElement>("main-area");
	} catch {
		return;
	}

	const player = new SVGAnimationPlayer(
		svgEl,
		narrativeConfig.totalDuration,
		{
			regions: narrativeConfig.tempoMap.regions,
			anchorSpeed: narrativeConfig.tempoMap.anchor_speed,
			strength: narrativeConfig.tempoMap.strength,
		},
		narrativeConfig.speedTracks.map((track) => ({
			label: track.speedKey,
			value: track.speed,
		})),
		{
			onTimeUpdate(snapshot) {
				if (!isScrubbing) {
					timeline.value = String(snapshot.position);
				}
				timeDisplay.textContent = `${formatTime(snapshot.wallClockElapsed)} / ${formatTime(snapshot.wallClockDuration)}`;
				updateStageUI(snapshot.svgTime, player.speedLevel);
			},
			onStateChange(state) {
				playPauseBtn.innerHTML =
					state === "playing"
						? '<svg viewBox="0 0 24 24" width="18" height="18" fill="currentColor"><rect x="5" y="3" width="4" height="18"/><rect x="15" y="3" width="4" height="18"/></svg>'
						: '<svg viewBox="0 0 24 24" width="18" height="18" fill="currentColor"><polygon points="6,3 20,12 6,21"/></svg>';
				playPauseBtn.ariaLabel = state === "playing" ? "Pause playback" : "Start playback";
				playPauseBtn.classList.toggle("playing", state === "playing");

				if (!isMuted) {
					if (state === "playing") {
						narrationPlayer.resume();
					} else {
						narrationPlayer.pause();
					}
				}
			},
			onSpeedChange(_speed, speedLevel, label) {
				speedLabel.textContent = label;
				speedSlider.value = String(speedLevel);
				renderStageButtons(trackForLevel(speedLevel));
				const snap = player.playbackSnapshot;
				timeDisplay.textContent = `${formatTime(snap.wallClockElapsed)} / ${formatTime(snap.wallClockDuration)}`;
				updateStageUI(snap.svgTime, speedLevel);
				if (!isMuted) {
					narrationPlayer.clearCache();
					if (player.playing) {
						const track = trackForLevel(speedLevel);
						const stage = getStageAtTime(track.stages, snap.svgTime, narrativeConfig.totalDuration);
						if (stage) {
							void narrationPlayer.speak(stage.narration.text);
						}
					}
					void narrationPlayer.prefetch(narrationTexts(speedLevel));
				}
			},
		},
	);

	let isScrubbing = false;
	let lastStageRef: string | null = null;
	let isMuted = true;
	const narrationPlayer = new NarrationPlayer();

	if (narrationPlayer.available) {
		muteBtn.disabled = false;
		muteBtn.title = "Toggle narration audio";
	}

	narrationPlayer.onQuotaExceeded = () => {
		isMuted = true;
		muteBtn.classList.remove("unmuted");
		muteBtn.title = "Narration credits unavailable";
		narrationPlayer.stop();
	};

	function trackForLevel(level: number): SpeedTrack {
		return narrativeConfig.speedTracks[level] ?? narrativeConfig.speedTracks[DEFAULT_SPEED_LEVEL];
	}

	function narrationTexts(speedLevel: number): string[] {
		return trackForLevel(speedLevel).stages.map((stage) => stage.narration.text);
	}

	function renderStageButtons(track: SpeedTrack) {
		stageButtonsContainer.innerHTML = "";
		for (const [index, stage] of track.stages.entries()) {
			const btn = document.createElement("button");
			btn.className = "stage-btn";
			btn.type = "button";
			btn.dataset.stageIndex = String(index);
			btn.textContent = stage.shortName;
			btn.title = `Jump to ${stage.name}`;
			btn.style.setProperty("--stage-color", stage.color);
			stageButtonsContainer.appendChild(btn);
		}
	}

	function updateStageUI(time: number, speedLevel: number) {
		const track = trackForLevel(speedLevel);
		const stage = getStageAtTime(track.stages, time, narrativeConfig.totalDuration);

		if (stage) {
			const stageRef = `${speedLevel}:${stage.id}`;
			const stageChanged = stageRef !== lastStageRef;
			lastStageRef = stageRef;

			stageLabel.textContent = stage.name;
			stageLabel.style.color = stage.color;
			narrativeText.textContent = stage.narration.text;
			narrativeText.classList.remove("faded");

			if (stageChanged) {
				narrativeText.parentElement?.scrollTo({ top: 0, behavior: "smooth" });
				if (!isMuted) {
					void narrationPlayer.speak(stage.narration.text);
				}
			}
		} else {
			lastStageRef = null;
			stageLabel.textContent = "";
			narrativeText.classList.add("faded");
		}

		for (const btn of stageButtonsContainer.querySelectorAll(".stage-btn")) {
			const el = btn as HTMLElement;
			const idx = Number(el.dataset.stageIndex ?? "-1");
			const activeStage = stage ? track.stages[idx] : null;
			el.classList.toggle("active", stage !== null && activeStage?.id === stage.id);
		}
	}

	muteBtn.addEventListener("click", () => {
		if (narrationPlayer.quotaExceeded) return;
		isMuted = !isMuted;
		muteBtn.classList.toggle("unmuted", !isMuted);
		if (isMuted) {
			narrationPlayer.stop();
		} else {
			const snap = player.playbackSnapshot;
			const track = trackForLevel(player.speedLevel);
			const stage = getStageAtTime(track.stages, snap.svgTime, narrativeConfig.totalDuration);
			if (stage) {
				void narrationPlayer.speak(stage.narration.text);
			}
			void narrationPlayer.prefetch(narrationTexts(player.speedLevel));
		}
	});

	playPauseBtn.addEventListener("click", () => player.toggle());

	timeline.max = "1";
	timeline.step = "0.001";
	timeline.addEventListener("input", () => {
		isScrubbing = true;
		narrationPlayer.stop();
		player.seekNormalized(Number(timeline.value));
	});
	timeline.addEventListener("change", () => {
		isScrubbing = false;
		if (!isMuted && player.playing) {
			const snap = player.playbackSnapshot;
			const track = trackForLevel(player.speedLevel);
			const stage = getStageAtTime(track.stages, snap.svgTime, narrativeConfig.totalDuration);
			if (stage) {
				void narrationPlayer.speak(stage.narration.text);
			}
		}
	});

	speedSlider.min = "0";
	speedSlider.max = String(narrativeConfig.speedTracks.length - 1);
	speedSlider.step = "1";
	speedSlider.value = String(DEFAULT_SPEED_LEVEL);
	speedSlider.addEventListener("input", () => {
		player.setSpeedLevel(Number(speedSlider.value));
	});

	speedDown.addEventListener("click", () => {
		const level = Math.max(0, player.speedLevel - 1);
		player.setSpeedLevel(level);
	});

	speedUp.addEventListener("click", () => {
		const level = Math.min(narrativeConfig.speedTracks.length - 1, player.speedLevel + 1);
		player.setSpeedLevel(level);
	});

	stageButtonsContainer.addEventListener("click", (event) => {
		const target = event.target as HTMLElement;
		const button = target.closest(".stage-btn") as HTMLElement | null;
		if (!button) return;
		const idx = Number(button.dataset.stageIndex ?? "-1");
		const stage = trackForLevel(player.speedLevel).stages[idx];
		if (!stage) return;
		player.seek(stage.startTime);
	});

	document.addEventListener("keydown", (event) => {
		if (event.code === "Space") {
			event.preventDefault();
			player.toggle();
		} else if (event.code === "ArrowLeft") {
			event.preventDefault();
			const snap = player.playbackSnapshot;
			const delta = (2 * snap.effectiveSpeed) / narrativeConfig.totalDuration;
			player.seekNormalized(snap.position - delta);
		} else if (event.code === "ArrowRight") {
			event.preventDefault();
			const snap = player.playbackSnapshot;
			const delta = (2 * snap.effectiveSpeed) / narrativeConfig.totalDuration;
			player.seekNormalized(snap.position + delta);
		}
	});

	function syncSvgContentWidth() {
		if (window.innerWidth <= 960) {
			stageButtonsContainer.style.width = "";
			transport.style.width = "";
			narrativeBox.style.flex = "";
			narrativeBox.style.paddingTop = "";
			return;
		}

		const box = svgEl.getBoundingClientRect();
		const vb = svgEl.viewBox.baseVal;
		if (!vb || vb.width === 0 || vb.height === 0) {
			stageButtonsContainer.style.width = `${box.width}px`;
			transport.style.width = `${box.width}px`;
			return;
		}

		const contentWidth = computeSvgContentWidth(
			box.width,
			box.height,
			vb.width,
			vb.height,
			SVG_CONTENT_INSET,
		);
		stageButtonsContainer.style.width = `${contentWidth}px`;
		transport.style.width = `${contentWidth}px`;

		const btnsHeight = stageButtonsContainer.getBoundingClientRect().height;
		narrativeBox.style.paddingTop = `${btnsHeight}px`;
	}

	syncSvgContentWidth();
	window.addEventListener("resize", syncSvgContentWidth);

	resizeHandle.addEventListener("mousedown", (event) => {
		if (window.innerWidth <= 960) return;
		event.preventDefault();
		resizeHandle.classList.add("dragging");
		const startX = event.clientX;
		const startWidth = narrativeBox.getBoundingClientRect().width;

		function onMove(moveEvent: MouseEvent) {
			const delta = startX - moveEvent.clientX;
			const newWidth = Math.max(250, Math.min(startWidth + delta, mainArea.offsetWidth * 0.55));
			narrativeBox.style.flex = `0 0 ${newWidth}px`;
			syncSvgContentWidth();
		}

		function onUp() {
			resizeHandle.classList.remove("dragging");
			document.removeEventListener("mousemove", onMove);
			document.removeEventListener("mouseup", onUp);
		}

		document.addEventListener("mousemove", onMove);
		document.addEventListener("mouseup", onUp);
	});

	renderStageButtons(trackForLevel(DEFAULT_SPEED_LEVEL));
	player.setSpeedLevel(DEFAULT_SPEED_LEVEL);
	const firstStage = trackForLevel(DEFAULT_SPEED_LEVEL).stages[0];
	const startTime = firstStage ? firstStage.startTime : 0;
	player.seek(startTime);
	updateStageUI(startTime, DEFAULT_SPEED_LEVEL);

	const snap = player.playbackSnapshot;
	timeDisplay.textContent = `${formatTime(snap.wallClockElapsed)} / ${formatTime(snap.wallClockDuration)}`;
	speedLabel.textContent = trackForLevel(DEFAULT_SPEED_LEVEL).speedKey;
	player.play();
}

initThemeToggle();
void init();
