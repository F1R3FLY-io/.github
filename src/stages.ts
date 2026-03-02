export interface StageLike {
	startTime: number;
	endTime: number;
}

function normalizeTime(time: number, totalDuration: number): number {
	if (totalDuration <= 0) return 0;
	return ((time % totalDuration) + totalDuration) % totalDuration;
}

export function getStageAtTime<T extends StageLike>(
	stages: readonly T[],
	time: number,
	totalDuration: number,
): T | null {
	if (!stages.length || totalDuration <= 0) return null;
	const t = normalizeTime(time, totalDuration);
	for (const stage of stages) {
		if (t >= stage.startTime && t < stage.endTime) {
			return stage;
		}
	}
	return null;
}
