import { type PlaybackSnapshot, PlaybackState, type TempoConfig } from "./playback-state";

export type { PlaybackSnapshot } from "./playback-state";

export interface SpeedSpec {
	label: string;
	value: number;
}

export type PlayerState = "playing" | "paused";

export interface PlayerOptions {
	onTimeUpdate?: (snapshot: PlaybackSnapshot) => void;
	onStateChange?: (state: PlayerState) => void;
	onSpeedChange?: (speed: number, speedLevel: number, speedLabel: string) => void;
}

export class SVGAnimationPlayer {
	private svg: SVGSVGElement;
	private state: PlayerState = "paused";
	private _playbackState: PlaybackState;
	private _speedIndex = 0;
	private animFrameId: number | null = null;
	private lastTimestamp: number | null = null;
	private callbacks: PlayerOptions;
	private speeds: SpeedSpec[];

	constructor(
		svg: SVGSVGElement,
		duration: number,
		tempo: TempoConfig,
		speeds: SpeedSpec[],
		options: PlayerOptions = {},
	) {
		this.svg = svg;
		this.callbacks = options;
		this.speeds = speeds;
		this._playbackState = new PlaybackState(duration, tempo.regions, tempo.anchorSpeed, tempo.strength);
		this._speedIndex = Math.max(
			0,
			this.speeds.findIndex((s) => s.value === 1),
		);
		this._playbackState.setGlobalSpeed(this.speed);
		this.svg.pauseAnimations();
		this.svg.setCurrentTime(0);
	}

	get playing(): boolean {
		return this.state === "playing";
	}

	get speed(): number {
		return this.speeds[this._speedIndex]?.value ?? 1;
	}

	get speedLabel(): string {
		return this.speeds[this._speedIndex]?.label ?? `${this.speed}x`;
	}

	get speedLevel(): number {
		return this._speedIndex;
	}

	get duration(): number {
		return this._playbackState.duration;
	}

	get playbackSnapshot(): PlaybackSnapshot {
		return this._playbackState.snapshot;
	}

	play(): void {
		if (this.state === "playing") return;
		this.state = "playing";
		this.lastTimestamp = null;
		this.animFrameId = requestAnimationFrame(this.tick);
		this.callbacks.onStateChange?.("playing");
	}

	pause(): void {
		if (this.state === "paused") return;
		this.state = "paused";
		if (this.animFrameId !== null) {
			cancelAnimationFrame(this.animFrameId);
			this.animFrameId = null;
		}
		this.lastTimestamp = null;
		this.callbacks.onStateChange?.("paused");
	}

	toggle(): void {
		if (this.state === "playing") {
			this.pause();
		} else {
			this.play();
		}
	}

	seek(time: number): void {
		this._playbackState.seekSvgTime(Math.max(0, Math.min(time, this.duration)));
		this.svg.setCurrentTime(this._playbackState.svgTime);
		this.callbacks.onTimeUpdate?.(this._playbackState.snapshot);
	}

	seekNormalized(pos: number): void {
		this._playbackState.seekNormalized(pos);
		this.svg.setCurrentTime(this._playbackState.svgTime);
		this.callbacks.onTimeUpdate?.(this._playbackState.snapshot);
	}

	setSpeedLevel(level: number): void {
		const clamped = Math.max(0, Math.min(level, this.speeds.length - 1));
		this._speedIndex = clamped;
		this._playbackState.setGlobalSpeed(this.speed);
		this.callbacks.onSpeedChange?.(this.speed, this._speedIndex, this.speedLabel);
	}

	setDuration(duration: number): void {
		this._playbackState.setDuration(duration);
	}

	destroy(): void {
		this.pause();
	}

	private tick = (timestamp: number): void => {
		if (this.state !== "playing") return;

		if (this.lastTimestamp !== null) {
			const delta = (timestamp - this.lastTimestamp) / 1000;
			this._playbackState.advance(delta);
			this.svg.setCurrentTime(this._playbackState.svgTime);
			this.callbacks.onTimeUpdate?.(this._playbackState.snapshot);
		}

		this.lastTimestamp = timestamp;
		this.animFrameId = requestAnimationFrame(this.tick);
	};
}
