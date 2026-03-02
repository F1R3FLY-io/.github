export const SVG_CONTENT_INSET = 10;

export function computeSvgContentWidth(
	svgWidth: number,
	svgHeight: number,
	vbWidth: number,
	vbHeight: number,
	inset: number = SVG_CONTENT_INSET,
): number {
	if (vbWidth === 0 || vbHeight === 0) return svgWidth;

	const aspect = vbWidth / vbHeight;
	const fitsWidth = svgWidth / svgHeight < aspect;
	const scale = fitsWidth ? svgWidth / vbWidth : svgHeight / vbHeight;
	const viewBoxRenderedWidth = fitsWidth ? svgWidth : svgHeight * aspect;

	return viewBoxRenderedWidth - 2 * inset * scale;
}
