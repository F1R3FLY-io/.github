import { describe, expect, it } from "vitest";
import { getStageAtTime } from "./stages";

interface TestStage {
	id: number;
	startTime: number;
	endTime: number;
}

const stages: TestStage[] = [
	{ id: 0, startTime: 0, endTime: 10 },
	{ id: 1, startTime: 12, endTime: 30 },
	{ id: 2, startTime: 35, endTime: 60 },
];

describe("getStageAtTime", () => {
	it("returns active stage for time in range", () => {
		expect(getStageAtTime(stages, 5, 60)?.id).toBe(0);
		expect(getStageAtTime(stages, 20, 60)?.id).toBe(1);
		expect(getStageAtTime(stages, 40, 60)?.id).toBe(2);
	});

	it("returns null in gaps", () => {
		expect(getStageAtTime(stages, 11, 60)).toBeNull();
		expect(getStageAtTime(stages, 31, 60)).toBeNull();
	});

	it("wraps negative and overflow times into total duration", () => {
		expect(getStageAtTime(stages, -5, 60)?.id).toBe(2);
		expect(getStageAtTime(stages, 65, 60)?.id).toBe(0);
	});
});
