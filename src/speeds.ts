export const SPEED_KEYS = ["0.10x", "0.25x", "1x", "1.5x", "2x"] as const;

export type SpeedKey = (typeof SPEED_KEYS)[number];

export const SPEED_VALUES: Readonly<Record<SpeedKey, number>> = {
	"0.10x": 0.1,
	"0.25x": 0.25,
	"1x": 1,
	"1.5x": 1.5,
	"2x": 2,
};

export const DEFAULT_SPEED_LEVEL = SPEED_KEYS.indexOf("1x");
