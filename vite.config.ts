import { defineConfig } from "vite";

export default defineConfig({
	base: "/",
	root: "src",
	envDir: "..",
	publicDir: "../docs/images",
	build: {
		outDir: "../dist",
		emptyOutDir: true,
	},
});
