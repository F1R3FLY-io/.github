import { SPEED_KEYS, SPEED_VALUES, type SpeedKey } from "./speeds";
import type { TempoRegion } from "./playback-state";

export interface Narration {
	tone: string;
	text: string;
	pause_ms: number;
}

export interface NarrativeStage {
	id: number;
	name: string;
	shortName: string;
	startTime: number;
	endTime: number;
	color: string;
	narration: Narration;
}

export interface SpeedTrack {
	speedKey: SpeedKey;
	speed: number;
	loopSeconds: number;
	detailLevel: string;
	stages: NarrativeStage[];
}

export interface TempoMapData {
	anchor_speed: number;
	strength: number;
	regions: TempoRegion[];
}

export interface NarrativeConfig {
	meta: {
		id: string;
		title: string;
		version: string;
	};
	totalDuration: number;
	speedTracks: SpeedTrack[];
	tempoMap: TempoMapData;
}

interface JsoncNarration {
	tone?: string;
	text?: string;
	pause_ms?: number;
}

interface JsoncStage {
	id?: string;
	name?: string;
	short_name?: string;
	start_time?: number;
	end_time?: number;
	color?: string;
	narration?: JsoncNarration;
}

interface JsoncProfile {
	speed_factor?: number;
	loop_seconds?: number;
	detail_level?: string;
}

interface JsoncRoot {
	meta?: {
		id?: string;
		title?: string;
		version?: string;
		total_duration_seconds?: number;
	};
	playback_profiles?: Partial<Record<SpeedKey, JsoncProfile>>;
	tempo_map?: {
		anchor_speed?: number;
		strength?: number;
		regions?: Array<{
			id?: string;
			start?: number;
			end?: number;
		}>;
	};
	stages_by_speed?: Partial<Record<SpeedKey, JsoncStage[]>>;
}

const DEFAULT_TOTAL_DURATION = 60;

const DEFAULT_STAGE_COUNTS: Record<SpeedKey, number> = {
	"0.10x": 7,
	"0.25x": 6,
	"1x": 5,
	"1.5x": 4,
	"2x": 3,
};

function clamp01(value: number): number {
	return Math.max(0, Math.min(1, value));
}

function stripJsoncComments(raw: string): string {
	return raw.replace(/^\s*\/\/.*$/gm, "");
}

function defaultStageTemplates(count: number, speedKey: SpeedKey): JsoncStage[] {
	const stages: JsoncStage[] = [];
	const segment = DEFAULT_TOTAL_DURATION / count;
	for (let i = 0; i < count; i += 1) {
		const start = Number((i * segment).toFixed(2));
		const end = Number(((i + 1) * segment).toFixed(2));
		stages.push({
			id: `stage_${i + 1}`,
			name: `Stage ${i + 1}`,
			short_name: `S${i + 1}`,
			start_time: start,
			end_time: end,
			color: i % 2 === 0 ? "#f4b942" : "#4bc0c8",
			narration: {
				tone: "placeholder",
				text: `Placeholder narrative for ${speedKey}, stage ${i + 1}.`,
				pause_ms: 160,
			},
		});
	}
	return stages;
}

function normalizeConfig(root: JsoncRoot): NarrativeConfig {
	const loop1x = root.playback_profiles?.["1x"]?.loop_seconds;
	const totalDuration =
		typeof loop1x === "number" && loop1x > 0
			? loop1x
			: typeof root.meta?.total_duration_seconds === "number" &&
				  root.meta.total_duration_seconds > 0
				? root.meta.total_duration_seconds
				: DEFAULT_TOTAL_DURATION;

	const speedTracks: SpeedTrack[] = SPEED_KEYS.map((speedKey) => {
		const profile = root.playback_profiles?.[speedKey];
		const speed = profile?.speed_factor ?? SPEED_VALUES[speedKey];
		const loopSeconds = profile?.loop_seconds ?? Number((totalDuration / speed).toFixed(2));
		const detailLevel = profile?.detail_level ?? "placeholder";
		const stageRows =
			root.stages_by_speed?.[speedKey] ?? defaultStageTemplates(DEFAULT_STAGE_COUNTS[speedKey], speedKey);

		const stages = stageRows
			.map((row, index) => {
				const startTime = Math.max(0, Math.min(totalDuration, row.start_time ?? index * 5));
				const endTime = Math.max(startTime, Math.min(totalDuration, row.end_time ?? startTime + 5));
				return {
					id: index,
					name: row.name ?? `Stage ${index + 1}`,
					shortName: row.short_name ?? `S${index + 1}`,
					startTime,
					endTime,
					color: row.color ?? "#f4b942",
					narration: {
						tone: row.narration?.tone ?? "placeholder",
						text: row.narration?.text ?? `Placeholder narrative for stage ${index + 1}.`,
						pause_ms: row.narration?.pause_ms ?? 160,
					},
				};
			})
			.sort((a, b) => a.startTime - b.startTime);

		return {
			speedKey,
			speed,
			loopSeconds,
			detailLevel,
			stages,
		};
	});

	const tempoMap: TempoMapData = {
		anchor_speed: root.tempo_map?.anchor_speed ?? 1,
		strength: root.tempo_map?.strength ?? 0,
		regions: (root.tempo_map?.regions ?? []).map((region, index) => ({
			id: region.id ?? `region_${index + 1}`,
			start: clamp01(region.start ?? 0),
			end: clamp01(region.end ?? 1),
		})),
	};

	return {
		meta: {
			id: root.meta?.id ?? "f1r3fly_explainer_speed_based",
			title: root.meta?.title ?? "F1R3FLY Explainer",
			version: root.meta?.version ?? "0.1.0",
		},
		totalDuration,
		speedTracks,
		tempoMap,
	};
}

function defaultConfig(): NarrativeConfig {
	return normalizeConfig({});
}

export async function loadNarrativeConfig(): Promise<NarrativeConfig> {
	try {
		const response = await fetch("/F1r3fly_explainer.jsonc");
		if (!response.ok) {
			return defaultConfig();
		}
		const raw = await response.text();
		const parsed: JsoncRoot = JSON.parse(stripJsoncComments(raw));
		return normalizeConfig(parsed);
	} catch {
		return defaultConfig();
	}
}
