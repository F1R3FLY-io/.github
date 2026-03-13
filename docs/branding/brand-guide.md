# F1R3FLY Brand Guide

Canonical brand reference for F1R3FLY documentation and product surfaces.
This guide is an implementation-friendly equivalent of:
`source/F1r3fly_Brand_Book-03.01.2026.pdf` (v1.0, March 2, 2026).

Token files in `tokens/` are the machine-readable source of truth.

## Source and Scope

- Source PDF: `source/F1r3fly_Brand_Book-03.01.2026.pdf`
- Extracted text: `source/brand-book-extracted-text.txt`
- Color pages used for gradient sampling:
  - `assets/reference-pages/color-palette-page-12.png`
  - `assets/reference-pages/secondary-color-palette-page-13.png`
- This package contains usable raster and gradient resources.
- For production vector lockups, request native design exports from the brand team.

## Logo

### Primary assets

- Full logo lockup (dark context): `assets/logos/f1r3fly-logo-primary-on-black.png`
- Full logo lockup (transparent): `assets/logos/f1r3fly-logo-primary-transparent.png`
- Logomark-only extract: `assets/logos/f1r3fly-logomark-from-brand-book.png`
- Single firefly icon extract: `assets/logos/f1r3fly-icon-single-firefly.png`

### Lockup rules

From the source brand book:

- Vertical lockup is primary.
- Vertical lockup proportions:
  - Logomark centered in the middle 60% of total lockup width.
  - 20% clear space on left and right.
  - Gap between logomark and wordmark is 60% of wordmark height.
- Horizontal lockup:
  - Logomark sits left of wordmark.
  - Gap between mark and wordmark is 20% of logomark width.
  - Wordmark sits in the center 60% of lockup height with 20% padding top/bottom.
- Same clear-space rules apply to lockups, logomark-only, and icon-only usage.

### Size guidance

- Logomark standalone maximum: 80px width.
- Icon (single firefly) standalone maximum: 60px width.
- Logomark standalone minimum: 40px width.
- Icon may scale down to favicon use.

### Background guidance

- Dark backgrounds are the primary usage context.
- Light background variants are approved but secondary.
- Do not recolor, distort, add effects, or place on low-contrast backgrounds.
- Always use provided files, not recreated approximations.

## Color Palette

Source: `tokens/colors.jsonc`

### Core colors

| Token | Hex | Usage |
|------|-----|-------|
| `black` | `#000000` | Primary brand surface/foundation |
| `yellow` | `#F3D630` | Brand highlight, headings, accents |
| `sage` | `#8BB999` | Brand mid-tone support |
| `sky` | `#3FA9F5` | Brand cool accent |

### Primary gradient

- `primary`: `#F3D630 -> #8BB999 -> #3FA9F5`
- Asset: `assets/gradients/primary-brand-gradient.svg`
- Use for section labels, navigation highlights, and brand accents.
- Do not use as large page background fill.

### Secondary audience gradients

Extracted from brand-book palette bars:

| Gradient | Stops (left -> middle -> right) | Asset |
|----------|----------------------------------|-------|
| `neutral` | `#282B2E -> #171E30 -> #061132` | `assets/gradients/neutral-gradient.svg` |
| `client` | `#5D0266 -> #6C0349 -> #7A042C` | `assets/gradients/client-gradient.svg` |
| `developer` | `#007CC2 -> #0086A6 -> #00908A` | `assets/gradients/developer-gradient.svg` |
| `partner` | `#108F22 -> #439518 -> #759C0F` | `assets/gradients/partner-gradient.svg` |

Use cases from source:

- Client gradient for client-facing elements.
- Developer gradient for developer-facing elements.
- Partner gradient for partner-facing elements.
- Neutral gradient for universal pairing with primary brand gradient.

## Typography

Source: `tokens/typography.jsonc`

### Font families

- Headings: Brandon Grotesque
- Body: Source Sans Pro

### Weight hierarchy

- Brandon Grotesque Bold: page titles, primary section headers
- Brandon Grotesque Medium: subheaders, card titles, navigation
- Brandon Grotesque Regular: eyebrow labels, secondary UI text
- Brandon Grotesque Light: large display text and hero headlines
- Source Sans Pro Light (300): default body copy

### Type rules from source

- Headings are uppercase with wide tracking.
- Headline setup:
  - Brandon Grotesque Bold
  - uppercase
  - tracking 25
  - leading 90%
- Subhead setup:
  - Brandon Grotesque Medium
  - uppercase
  - tracking 25
  - scale from one-third to two-thirds headline size
- Body setup:
  - Source Sans Pro Light (300)
  - 16px base
  - `0.04em` tracking

## Voice and Messaging

Source summary from the brand book:

- Clear, technically accurate, no hype
- Business-friendly, not academic
- Confident and grounded (avoid speculative Web3 hype tone)
- Visionary, anchored in real use cases

Approved tagline:

- `Concurrency for the people.`

Preferred terms:

- verifiable infrastructure
- audit-ready data
- provable systems
- evidence-first

Avoid:

- investment language
- unverified green claims
- crypto hype framing
- aggressive competitor language
- deep jargon on public-facing pages

## Brand Architecture

F1R3FLY uses an endorsed model:

- Master brand leads all sub-brands.
- Shared foundation remains constant:
  - F1R3FLY name + firefly mark
  - dark visual foundation
  - Brandon Grotesque heading system
  - consistent tone/language
- Sub-brands may vary accent color and sector imagery.

Machine-readable hierarchy:

- `brand-architecture.yaml`

## Accessibility Baseline

Minimum standard: WCAG AA.

- Validate contrast ratios.
- Use proper heading structure.
- Label all form controls.
- Keep readable type size.
- Suggested tooling: Pa11y, axe-core, Lighthouse.

## Templates and Operational Notes

Source brand book marks these as in development:

- presentation template
- email signature template
- social templates
- brand asset portal

Until centralized distribution is finalized, treat this folder as the working source for repository documentation usage.

## Consuming the Tokens

### Tailwind projects

```typescript
// tailwind.config.ts
import f1r3flyPreset from "./docs/branding/presets/tailwind-preset";

export default {
  presets: [f1r3flyPreset],
  content: ["./src/**/*.{ts,tsx,js,jsx,mdx}"],
};
```

### CSS-only projects

```css
@import "./docs/branding/presets/css-variables.css";
```

## File Index

```
docs/branding/
  brand-guide.md
  brand-architecture.yaml
  source/
    F1r3fly_Brand_Book-03.01.2026.pdf
    brand-book-extracted-text.txt
  tokens/
    colors.jsonc
    typography.jsonc
    spacing.jsonc
    shadows.jsonc
    radii.jsonc
  presets/
    css-variables.css
    tailwind-preset.ts
  assets/
    logos/
      f1r3fly-logo-primary-on-black.png
      f1r3fly-logo-primary-transparent.png
      f1r3fly-logomark-transparent.png
      f1r3fly-logomark-from-brand-book.png
      f1r3fly-icon-single-firefly.png
      f1r3fly-arc-stroke-large.png
      f1r3fly-arc-stroke-medium.png
    gradients/
      primary-brand-gradient.svg
      neutral-gradient.svg
      client-gradient.svg
      developer-gradient.svg
      partner-gradient.svg
    reference-pages/
      color-palette-page-12.png
      secondary-color-palette-page-13.png
    source-extracts/
      README.md
      extract-*.png
```
