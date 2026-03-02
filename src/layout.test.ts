import { describe, expect, it } from "vitest";
import { SVG_CONTENT_INSET, computeSvgContentWidth } from "./layout";

describe("computeSvgContentWidth", () => {
	const VB_W = 800;
	const VB_H = 780;

	it("calculates content width for height-constrained SVG rendering", () => {
		const svgW = 1130;
		const svgH = 746;
		const width = computeSvgContentWidth(svgW, svgH, VB_W, VB_H);
		const scale = svgH / VB_H;
		const expected = svgH * (VB_W / VB_H) - 2 * SVG_CONTENT_INSET * scale;
		expect(width).toBeCloseTo(expected, 5);
	});

	it("calculates content width for width-constrained SVG rendering", () => {
		const svgW = 400;
		const svgH = 800;
		const width = computeSvgContentWidth(svgW, svgH, VB_W, VB_H);
		const scale = svgW / VB_W;
		const expected = svgW - 2 * SVG_CONTENT_INSET * scale;
		expect(width).toBeCloseTo(expected, 5);
	});

	it("returns svgWidth when viewBox dimensions are invalid", () => {
		expect(computeSvgContentWidth(500, 300, 0, 0)).toBe(500);
		expect(computeSvgContentWidth(500, 300, 800, 0)).toBe(500);
		expect(computeSvgContentWidth(500, 300, 0, 780)).toBe(500);
	});
});
