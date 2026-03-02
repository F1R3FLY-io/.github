export interface TempoRegion {
	id: string;
	start: number;
	end: number;
}

export interface TempoConfig {
	regions: TempoRegion[];
	anchorSpeed: number;
	strength: number;
}

export interface PlaybackSnapshot {
	position: number;
	svgTime: number;
	wallClockElapsed: number;
	wallClockDuration: number;
	effectiveSpeed: number;
	globalSpeed: number;
}

interface Segment {
	start: number;
	end: number;
	anchored: boolean;
}

export class PlaybackState {
	private _position = 0;
	private _globalSpeed = 1;
	private _segments: Segment[];
	private _anchorSpeed: number;
	private _strength: number;
	private _anchoredWidth: number;
	private _paddingWidth: number;
	private _duration: number;

	constructor(duration: number, regions: TempoRegion[] = [], anchorSpeed = 1.0, strength = 0.5) {
		this._duration = Math.max(1, duration);
		this._anchorSpeed = anchorSpeed;
		this._strength = Math.max(0, Math.min(1, strength));
		this._segments = buildSegments(regions);
		this._anchoredWidth = this._segments
			.filter((s) => s.anchored)
			.reduce((acc, s) => acc + (s.end - s.start), 0);
		this._paddingWidth = 1 - this._anchoredWidth;
	}

	get position(): number {
		return this._position;
	}

	get duration(): number {
		return this._duration;
	}

	get svgTime(): number {
		return this._position * this._duration;
	}

	get globalSpeed(): number {
		return this._globalSpeed;
	}

	get effectiveSpeed(): number {
		return this._globalSpeed * this.modifierAt(this._position);
	}

	get wallClockDuration(): number {
		return this.wallClockForRange(0, 1);
	}

	get wallClockElapsed(): number {
		return this.wallClockForRange(0, this._position);
	}

	get snapshot(): PlaybackSnapshot {
		return {
			position: this._position,
			svgTime: this._position * this._duration,
			wallClockElapsed: this.wallClockElapsed,
			wallClockDuration: this.wallClockDuration,
			effectiveSpeed: this.effectiveSpeed,
			globalSpeed: this._globalSpeed,
		};
	}

	setDuration(duration: number): void {
		this._duration = Math.max(1, duration);
	}

	setGlobalSpeed(speed: number): void {
		this._globalSpeed = Math.max(0.01, speed);
	}

	advance(wallClockDelta: number): void {
		const mod = this.modifierAt(this._position);
		const posDelta = (wallClockDelta * this._globalSpeed * mod) / this._duration;
		this._position += posDelta;
		if (this._position >= 1) {
			this._position = this._position % 1;
		}
	}

	seekNormalized(pos: number): void {
		this._position = Math.max(0, Math.min(pos, 1));
	}

	seekSvgTime(t: number): void {
		this._position = Math.max(0, Math.min(t / this._duration, 1));
	}

	private anchoredModifier(): number {
		if (this._anchoredWidth === 0) return 1;
		const effective = this._globalSpeed * (1 - this._strength) + this._anchorSpeed * this._strength;
		return effective / this._globalSpeed;
	}

	private paddingModifier(): number {
		if (this._paddingWidth === 0 || this._anchoredWidth === 0) return 1;
		const anchoredEffective =
			this._globalSpeed * (1 - this._strength) + this._anchorSpeed * this._strength;
		const anchoredWallClock = (this._anchoredWidth * this._duration) / anchoredEffective;
		const totalWallClock = this._duration / this._globalSpeed;
		const paddingWallClock = totalWallClock - anchoredWallClock;
		if (paddingWallClock <= 0) return 1;
		const paddingEffective = (this._paddingWidth * this._duration) / paddingWallClock;
		return paddingEffective / this._globalSpeed;
	}

	private modifierAt(pos: number): number {
		for (const seg of this._segments) {
			if (pos >= seg.start && pos < seg.end) {
				return seg.anchored ? this.anchoredModifier() : this.paddingModifier();
			}
		}
		return this.paddingModifier();
	}

	private wallClockForRange(from: number, to: number): number {
		const aMod = this.anchoredModifier();
		const pMod = this.paddingModifier();
		let total = 0;
		for (const seg of this._segments) {
			const overlapStart = Math.max(from, seg.start);
			const overlapEnd = Math.min(to, seg.end);
			if (overlapStart >= overlapEnd) continue;
			const segWidth = overlapEnd - overlapStart;
			const mod = seg.anchored ? aMod : pMod;
			total += (segWidth * this._duration) / (this._globalSpeed * mod);
		}
		return total;
	}
}

function buildSegments(regions: TempoRegion[]): Segment[] {
	if (regions.length === 0) {
		return [{ start: 0, end: 1, anchored: false }];
	}

	const sorted = [...regions]
		.map((r) => ({ ...r, start: Math.max(0, Math.min(1, r.start)), end: Math.max(0, Math.min(1, r.end)) }))
		.sort((a, b) => a.start - b.start);
	const segments: Segment[] = [];
	let cursor = 0;

	for (const r of sorted) {
		const start = Math.max(r.start, cursor);
		if (start > cursor) {
			segments.push({ start: cursor, end: start, anchored: false });
		}
		if (r.end > start) {
			segments.push({ start, end: r.end, anchored: true });
			cursor = r.end;
		}
	}

	if (cursor < 1) {
		segments.push({ start: cursor, end: 1, anchored: false });
	}

	return segments;
}
