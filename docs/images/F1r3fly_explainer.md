# F1R3FLY Explainer Narration Draft

This markdown file is the editable narrative source for the explainer scaffold.

Runtime consumers currently load `docs/images/F1r3fly_explainer.jsonc`.

## Scaffold Notes

- SMIL animation asset will be provided later as `docs/images/F1r3fly_explainer.svg`.
- Playback speeds are fixed to:
  - `0.10x`
  - `0.25x`
  - `1x`
  - `1.5x`
  - `2x`
- Baseline loop target is `60s` at `1x`.
- Stage counts are expected to vary by speed profile:
  - `0.10x` about 7 stages
  - `1x` about 5 stages
  - `2x` about 3 stages

## Update Flow

1. Edit stage timing windows and narrative text in this markdown.
2. Synchronize updates into `F1r3fly_explainer.jsonc`.
3. Validate via `npm run build` and visual playback in `npm run dev`.
