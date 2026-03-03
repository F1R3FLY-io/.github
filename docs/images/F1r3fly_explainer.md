# F1R3FLY Explainer Narration Draft

This markdown file is the editable narrative source for the explainer scaffold.

Runtime consumers currently load `docs/images/F1r3fly_explainer.jsonc`.

## Strategy

- Use a **single master SMIL SVG**: `docs/images/F1r3fly_explainer.svg`.
- Keep one visual timeline at `1x` (`60s`) and vary narration/stage mapping by speed profile in JSONC.
- Playback speeds are fixed to:
  - `0.10x`
  - `0.25x`
  - `1x`
  - `1.5x`
  - `2x`
- Stage counts vary by speed profile:
  - `0.10x` about 7 stages
  - `1x` about 5 stages
  - `2x` about 3 stages

## Approved 1x Narrative (60s, 5 stages)

### Stage 1 (0:00-0:08) — Problem Framing

Firefly rethinks high-throughput systems. The old single-instruction model was built for one machine. Modern workloads are distributed, concurrent, and always on.

### Stage 2 (0:08-0:20) — Architecture Shift

Traditional scaling copies the same line: more cores, more servers, more coordination overhead. Dataflow flips this. Work begins when data arrives, and execution routes through flexible compute paths.

### Stage 3 (0:20-0:34) — Message-First Model

Most stacks bolt messaging on with external queues. Pi and rho calculus make communication first-class, so protocols are visible to the type system. That enables design-time guarantees instead of production-time guesswork.

### Stage 4 (0:34-0:50) — Correctness + Performance

Behavioral typing lets us check deadlock risk, protocol order, and resource safety while targeting modern parallel silicon. That gives stronger correctness and a path toward Byzantine fault tolerance with crash-fault-like performance.

### Stage 5 (0:50-1:00) — Outcome + CTA

Firefly delivers this through tools, systems, and services: design, verify, and deploy message-first software for distributed backends, AI pipelines, and blockchain infrastructure. Move from ad-hoc concurrency to provable concurrent systems.

## Approved 1.5x Narrative (40s, 4 stages)

### Stage 1 (0:00-0:10) — Problem Framing

Firefly rethinks high-throughput systems. Sequential, single-instruction assumptions break under distributed, concurrent, always-on workloads.

### Stage 2 (0:10-0:25) — Architecture Shift

Traditional scaling copies the same line: more cores, more servers, more coordination overhead. Dataflow changes this: work starts on data arrival and routes across flexible compute paths.

### Stage 3 (0:25-0:42) — Message-First Model

Most stacks treat messaging as an external queue. Pi and rho calculus make communication first-class and type-visible, enabling design-time protocol guarantees instead of runtime guesswork.

### Stage 4 (0:42-1:00) — Outcome + CTA

Behavioral typing plus dataflow execution strengthens correctness and performance, with a path toward Byzantine fault tolerance efficiency. Firefly tools, systems, and services make this deployable.

## Approved 2x Narrative (30s, 3 stages)

### Stage 1 (0:00-0:20) — Problem + Shift

Firefly rethinks high-throughput systems: single-machine assumptions fail for distributed, concurrent workloads. Dataflow replaces rigid sequencing with work triggered by data arrival.

### Stage 2 (0:20-0:42) — Message-First Model

Pi and rho calculus make communication first-class and visible to the type system, moving concurrency from test-and-hope to design-time guarantees.

### Stage 3 (0:42-1:00) — Outcome + CTA

This yields stronger correctness and performance, with a path toward crash-fault-like Byzantine fault tolerance efficiency. Firefly delivers design, verification, and deployment tooling for message-first systems.

## Approved 0.25x Narrative (240s profile, 6 stages)

### Stage 1 (0:00-0:05) — Problem Framing

Firefly rethinks high-throughput systems. Single-machine, single-instruction assumptions do not match distributed, concurrent, always-on workloads.

### Stage 2 (0:05-0:15) — Architecture Shift

Traditional scaling replicates the same line: more cores, more servers, more coordination complexity. Dataflow reverses that pattern. Work activates when data is ready and routes through flexible compute paths.

### Stage 3 (0:15-0:27) — Message-First Model

Many stacks treat messaging as infrastructure outside the language model. Pi and rho calculus make communication first-class and type-visible, so protocols can be reasoned about and checked before production deployment.

### Stage 4 (0:27-0:39) — Correctness by Construction

Behavioral typing helps verify deadlock risk, protocol order, and constrained resource behavior at design time. This shifts concurrency engineering from reactive debugging toward proactive correctness.

### Stage 5 (0:39-0:51) — Performance + BFT Efficiency

Dataflow execution aligns with modern parallel silicon and helps sustain throughput under distributed coordination. The target is Byzantine fault tolerance with operational efficiency closer to crash-fault systems.

### Stage 6 (0:51-1:00) — Outcome + CTA

Firefly provides tools, systems, and services to design, verify, and deploy message-first software. Move from ad-hoc concurrency to provable distributed infrastructure.

## Approved 0.10x Narrative (600s profile, 7 stages)

### Stage 1 (0:00-0:04) — Opening Frame

Firefly rethinks high-throughput systems from first principles. This explainer shows why sequential assumptions break down and what replaces them.

### Stage 2 (0:04-0:12) — Context + Stakes

Classical software design was optimized for a single instruction stream on a single machine. Modern systems are distributed, concurrent, heterogeneous, and latency-sensitive. That mismatch creates reliability and scaling risks at the architecture level.

### Stage 3 (0:12-0:20) — Sequential Bottleneck

Traditional scaling copies the same line: more cores, more servers, more shared-state coordination. Teams then manage race conditions, lock contention, and complex failure modes with growing operational overhead.

### Stage 4 (0:20-0:30) — Dataflow Transition

Dataflow changes control logic. Work is triggered by data availability rather than a rigid instruction pointer. Execution routes through adaptive compute graphs that match modern silicon and distributed runtime behavior.

### Stage 5 (0:30-0:40) — Message-First Model

Most platforms bolt messaging on with external queues, so protocol behavior sits outside the type system. Pi and rho calculus make communication first-class. Channels and processes become type-visible, enabling explicit protocol modeling and stronger compile-time guarantees.

### Stage 6 (0:40-0:51) — Correctness + Performance

Behavioral typing supports design-time checks for deadlock risk, protocol ordering, and constrained resource usage. Combined with dataflow execution, this improves both correctness and throughput, with a path toward Byzantine fault tolerance at crash-fault-like efficiency.

### Stage 7 (0:51-1:00) — Outcome + Deployment

Firefly delivers this through tools, systems, and services for design, verification, and deployment. The result is a practical move from ad-hoc concurrency to provable concurrent infrastructure for blockchains, AI pipelines, and distributed backends.

## Mapping Guidance For Other Speeds

- `2x`, `1.5x`, `1x`, `0.25x`, and `0.10x` are now drafted.
- `1x` remains the canonical timeline for the single master SVG.

## Update Flow

1. Edit stage timing windows and narrative text in this markdown.
2. Synchronize updates into `F1r3fly_explainer.jsonc`.
3. Validate via `pnpm run build` and visual playback in `pnpm run dev`.
