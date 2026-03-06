/**
 * F1R3FLY shared Tailwind CSS preset.
 *
 * Source:
 * - docs/branding/tokens/
 * - docs/branding/presets/css-variables.css
 */

import type { Config } from "tailwindcss";

const preset: Partial<Config> = {
	theme: {
		extend: {
			colors: {
				"f1-black": "var(--f1-black)",
				"f1-yellow": "var(--f1-yellow)",
				"f1-sage": "var(--f1-sage)",
				"f1-sky": "var(--f1-sky)",

				"f1-bg": "var(--f1-bg)",
				"f1-surface": "var(--f1-surface)",
				"f1-surface-hover": "var(--f1-surface-hover)",
				"f1-border": "var(--f1-border)",
				"f1-text": "var(--f1-text)",
				"f1-text-muted": "var(--f1-text-muted)",
				"f1-text-dim": "var(--f1-text-dim)",
			},

			backgroundImage: {
				"f1-gradient-primary": "var(--f1-gradient-primary)",
				"f1-gradient-neutral": "var(--f1-gradient-neutral)",
				"f1-gradient-client": "var(--f1-gradient-client)",
				"f1-gradient-developer": "var(--f1-gradient-developer)",
				"f1-gradient-partner": "var(--f1-gradient-partner)",
			},

			fontFamily: {
				heading: [
					"Brandon Grotesque",
					"Avenir Next",
					"Segoe UI",
					"sans-serif",
				],
				body: ["Source Sans Pro", "Segoe UI", "Helvetica", "sans-serif"],
			},

			letterSpacing: {
				widecaps: "0.04em",
			},

			borderRadius: {
				pill: "9999px",
			},
		},
	},
};

export default preset;
