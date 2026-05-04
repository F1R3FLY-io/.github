interface ImportMetaEnv {
	readonly VITE_EL_TTS?: string;
	readonly VITE_EL_VOICE?: string;
	readonly [key: string]: string | undefined;
}

interface ImportMeta {
	readonly env: ImportMetaEnv;
}
