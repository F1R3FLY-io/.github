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

### Stage 1 (0:00-0:08) -- Lambda Calculus Foundations

Lambda calculus gave computing its theoretical foundation. Church and Turing showed that pure functions and sequential evaluation define what is computable. But the model assumes a single thread of control with no primitives for concurrency, distribution, or communication channels.

### Stage 2 (0:08-0:20) -- Von Neumann Bottleneck

Von Neumann architectures hardwired this sequential model into silicon. Scaling meant more cores, more servers, more shared-state coordination: the SISD to MIMD transition. But composition remains the unsolved challenge -- race conditions, deadlock, and fragile concurrency emerge wherever parallel components share mutable state.

### Stage 3 (0:20-0:34) -- Pi/Rho Calculus: Messages in the Type System

Milner's pi-calculus replaced shared state with message passing as the fundamental primitive. Rho-calculus goes further: channels become first-class values inside the type system rather than external infrastructure. This makes protocol behavior type-checkable at design time.

### Stage 4 (0:34-0:50) -- Correctness by Construction + BFT

Spatial behavioral typing checks deadlock freedom, race freedom, protocol adherence, and linear resource usage at compile time. Combined with Byzantine fault tolerant consensus, the system maintains correctness even when nodes fail or act maliciously.

### Stage 5 (0:50-1:00) -- Tools, Systems, Services

Firefly delivers this through four pillars: visually model, debug, design, and develop concurrent systems. Move from ad-hoc concurrency to provable concurrent systems.

## Approved 1.5x Narrative (40s, 4 stages)

### Stage 1 (0:00-0:10) -- Lambda Calculus to Von Neumann

Lambda calculus defined computation as sequential pure functions. Von Neumann architectures hardwired this into silicon. Scaling to multicore and distributed systems exposed fundamental limits: race conditions, deadlock, and brittle shared-state composition.

### Stage 2 (0:10-0:25) -- Pi/Rho Calculus + Type Channels

Milner's pi-calculus replaced shared state with message passing. Rho-calculus embeds channels as first-class values inside the type system, making protocol behavior checkable at design time rather than bolted on via external queues.

### Stage 3 (0:25-0:42) -- Correctness + BFT

Spatial behavioral typing verifies deadlock freedom, protocol adherence, and linear resource safety at compile time. Combined with BFT consensus, this yields correctness even under adversarial node failures.

### Stage 4 (0:42-1:00) -- Outcome + CTA

Firefly delivers tools, systems, and services to visually model, debug, design, and deploy provable concurrent infrastructure. Move from ad-hoc concurrency to systems you can verify before they ship.

## Approved 2x Narrative (30s, 3 stages)

### Stage 1 (0:00-0:20) -- Lambda Calculus to Pi/Rho

Lambda calculus and Von Neumann architectures assumed sequential execution. Milner's pi-calculus and rho-calculus replace shared state with first-class typed channels, making protocol behavior verifiable at design time.

### Stage 2 (0:20-0:42) -- Correctness + BFT

Spatial behavioral typing checks deadlock freedom, race freedom, and linear resources at compile time, while BFT consensus sustains correctness under adversarial conditions.

### Stage 3 (0:42-1:00) -- Outcome + CTA

Firefly delivers design, verification, and deployment tooling for provable concurrent systems. Move from ad-hoc concurrency to infrastructure you can trust.

## Approved 0.25x Narrative (240s profile, 6 stages)

### Stage 1 (0:00-0:05) -- Lambda Calculus Foundations

Lambda calculus established the theoretical foundations of computation. Church and Turing formalized computation as pure sequential functions operating on a single thread of control, with no model for concurrency or communication.

### Stage 2 (0:05-0:15) -- Von Neumann Bottleneck

Von Neumann architectures implemented this sequential model in hardware. Scaling meant replicating the same line: more cores, more servers, more shared-state coordination. The SISD to MIMD transition introduced race conditions, deadlock, and fragile composition as fundamental engineering challenges.

### Stage 3 (0:15-0:27) -- Pi/Rho Calculus: Messages in the Type System

Milner's pi-calculus replaced shared state with message passing as the computational primitive. Rho-calculus embeds channels as first-class type-system values rather than external infrastructure. Protocols become visible and checkable at design time instead of runtime.

### Stage 4 (0:27-0:39) -- Correctness by Construction

Spatial behavioral typing enables compile-time verification of deadlock freedom, race freedom, protocol adherence, and linear resource constraints. This shifts concurrency engineering from reactive debugging toward proactive correctness.

### Stage 5 (0:39-0:51) -- Performance + BFT

Dataflow execution aligns with modern parallel silicon and sustains throughput under distributed coordination. Combined with Byzantine fault tolerance, the system maintains correctness even when nodes behave adversarially, approaching crash-fault-like efficiency.

### Stage 6 (0:51-1:00) -- Outcome + CTA

Firefly provides tools, systems, and services to visually model, debug, design, and deploy message-first software. Move from ad-hoc concurrency to provable concurrent infrastructure.

## Approved 0.10x Narrative (600s profile, 7 stages)

### Stage 1 (0:00-0:04) -- Opening Frame

Firefly rethinks high-throughput systems by tracing the intellectual lineage from lambda calculus to provable concurrent infrastructure. This explainer follows that arc.

### Stage 2 (0:04-0:12) -- Lambda Calculus Foundations

Church and Turing formalized computation as sequential pure functions. Lambda calculus defines what is computable but assumes a single thread of control. It offers no model for concurrency, no distribution primitives, and no channel abstractions. This limitation shaped every architecture that followed.

### Stage 3 (0:12-0:20) -- Von Neumann Bottleneck

Von Neumann architectures hardwired sequential execution into silicon. Traditional scaling replicates the same line: more cores, more servers, more shared-state coordination. The SISD to MIMD transition created race conditions, deadlock, and composition problems that operational tooling cannot fully resolve.

### Stage 4 (0:20-0:30) -- Dataflow Transition

Dataflow architectures change control logic. Work is triggered by data availability rather than a rigid instruction pointer. Execution routes through adaptive compute graphs that match modern silicon and distributed runtime behavior.

### Stage 5 (0:30-0:40) -- Pi/Rho Calculus: Messages in the Type System

Milner's pi-calculus replaced shared state with message passing as the fundamental primitive. Rho-calculus takes this further: channels become first-class values inside the type system. Protocol behavior becomes type-visible, enabling explicit protocol modeling and stronger compile-time guarantees -- not external queues bolted on after the fact.

### Stage 6 (0:40-0:51) -- Correctness by Construction + BFT

Spatial behavioral typing supports compile-time checks for deadlock freedom, race freedom, protocol adherence, and linear resource constraints. Combined with Byzantine fault tolerant consensus and dataflow execution, this improves both correctness and throughput while sustaining performance under adversarial conditions.

### Stage 7 (0:51-1:00) -- Tools, Systems, Services

Firefly delivers this through tools, systems, and services for visual modeling, debugging, design, and deployment. The result is a practical move from ad-hoc concurrency to provable concurrent infrastructure for blockchains, AI pipelines, and distributed backends.

## Mapping Guidance For Other Speeds

- `2x`, `1.5x`, `1x`, `0.25x`, and `0.10x` are now drafted.
- `1x` remains the canonical timeline for the single master SVG.

## Update Flow

1. Edit stage timing windows and narrative text in this markdown.
2. Synchronize updates into `F1r3fly_explainer.jsonc`.
3. Validate via `pnpm run build` and visual playback in `pnpm run dev`.
