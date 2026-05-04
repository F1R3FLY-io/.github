import { describe, expect, it } from "vitest";
import { PlaybackState, type TempoRegion } from "./playback-state";

function region(id: string, start: number, end: number): TempoRegion {
	return { id, start, end };
}

describe("PlaybackState", () => {
	it("initializes with zero position and configured duration", () => {
		const state = new PlaybackState(60);
		expect(state.position).toBe(0);
		expect(state.svgTime).toBe(0);
		expect(state.duration).toBe(60);
	});

	it("clamps normalized seek to [0, 1]", () => {
		const state = new PlaybackState(60);
		state.seekNormalized(-1);
		expect(state.position).toBe(0);
		state.seekNormalized(2);
		expect(state.position).toBe(1);
	});

	it("keeps wall-clock duration invariant to duration/globalSpeed", () => {
		const state = new PlaybackState(60, [region("a", 0.2, 0.5)], 1, 0.6);
		state.setGlobalSpeed(2);
		expect(state.wallClockDuration).toBeCloseTo(30, 5);
		state.setGlobalSpeed(0.5);
		expect(state.wallClockDuration).toBeCloseTo(120, 5);
	});

	it("anchors effective speed inside anchored regions when speeding up", () => {
		const state = new PlaybackState(60, [region("a", 0.2, 0.5)], 1, 0.5);
		state.setGlobalSpeed(2);
		state.seekNormalized(0.3);
		expect(state.effectiveSpeed).toBeLessThan(2);
		expect(state.effectiveSpeed).toBeGreaterThan(1);
	});

	it("advances and wraps position after duration", () => {
		const state = new PlaybackState(60);
		state.advance(61);
		expect(state.position).toBeGreaterThanOrEqual(0);
		expect(state.position).toBeLessThan(1);
	});
});
