const API_KEY = import.meta.env.VITE_EL_TTS as string | undefined;
const VOICE_ID = import.meta.env.VITE_EL_VOICE as string | undefined;
const MODEL_ID = "eleven_v3";
const OUTPUT_FORMAT = "mp3_44100_128";

const VOICE_SETTINGS = {
	stability: 0.4,
	similarity_boost: 0.75,
	style: 0.0,
	speed: 1.1,
	use_speaker_boost: true,
};

export class NarrationPlayer {
	private audio: HTMLAudioElement | null = null;
	private lastText: string | null = null;
	private cache = new Map<string, string>();
	private fetching = new Map<string, Promise<string | null>>();
	private _quotaExceeded = false;

	onQuotaExceeded?: () => void;

	get available(): boolean {
		return Boolean(API_KEY && VOICE_ID);
	}

	get quotaExceeded(): boolean {
		return this._quotaExceeded;
	}

	async prefetch(texts: string[]): Promise<void> {
		if (!this.available) return;
		const needed = texts.filter((t) => t && !this.cache.has(t) && !this.fetching.has(t));
		if (!needed.length) return;
		await Promise.allSettled(needed.map((text) => this.ensureFetched(text)));
	}

	async speak(text: string): Promise<void> {
		if (!this.available || !text) return;
		if (this.lastText === text && this.audio && !this.audio.paused) return;

		this.stopPlayback();
		this.lastText = text;

		let url: string | null | undefined = this.cache.get(text);
		if (!url) {
			url = await this.ensureFetched(text);
			if (!url || this.lastText !== text) return;
		}

		this.audio = new Audio(url);
		try {
			await this.audio.play();
		} catch {
			// Ignore autoplay restrictions and decode errors.
		}
	}

	stop(): void {
		this.stopPlayback();
	}

	pause(): void {
		this.audio?.pause();
	}

	resume(): void {
		if (this.audio?.paused && this.audio.src) {
			void this.audio.play();
		}
	}

	get playing(): boolean {
		return this.audio !== null && !this.audio.paused;
	}

	clearCache(): void {
		this.stopPlayback();
		for (const url of this.cache.values()) {
			URL.revokeObjectURL(url);
		}
		this.cache.clear();
		this.fetching.clear();
	}

	private stopPlayback(): void {
		this.lastText = null;
		if (this.audio) {
			this.audio.pause();
			this.audio.removeAttribute("src");
			this.audio = null;
		}
	}

	private async ensureFetched(text: string): Promise<string | null> {
		const cached = this.cache.get(text);
		if (cached) return cached;

		const pending = this.fetching.get(text);
		if (pending) return pending;

		const promise = this.fetchAudio(text);
		this.fetching.set(text, promise);
		try {
			return await promise;
		} finally {
			this.fetching.delete(text);
		}
	}

	private async fetchAudio(text: string): Promise<string | null> {
		if (!API_KEY || !VOICE_ID) return null;
		try {
			const response = await fetch(
				`https://api.elevenlabs.io/v1/text-to-speech/${VOICE_ID}/stream?output_format=${OUTPUT_FORMAT}`,
				{
					method: "POST",
					headers: {
						"Content-Type": "application/json",
						"xi-api-key": API_KEY,
					},
					body: JSON.stringify({
						text,
						model_id: MODEL_ID,
						voice_settings: VOICE_SETTINGS,
					}),
				},
			);
			if (!response.ok) {
				if ((response.status === 401 || response.status === 429) && !this._quotaExceeded) {
					this._quotaExceeded = true;
					this.onQuotaExceeded?.();
				}
				return null;
			}
			const blob = await response.blob();
			const url = URL.createObjectURL(blob);
			this.cache.set(text, url);
			return url;
		} catch {
			return null;
		}
	}
}
