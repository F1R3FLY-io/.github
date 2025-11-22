# Whiteboard Talk Script (Screenplay Style, ~9–10 Minutes)

## Scene 1 – Cold Open (0:00–0:30)
- VO: “I’m Jeff from Firefly. In the next ten minutes, I’ll show why the old single-CPU mindset is breaking, how a message-first model fixes it, and how that delivers performance, fault tolerance, and AI gains.”
- Visual: Wide shot of the whole board; Firefly butterfly at center.

## Scene 2 – Set the Contrast: von Neumann vs. Dataflow (0:30–2:00)
- VO: “Start on the left. Traditional computing is a straight conveyor: one instruction pointer, one memory, everything in a rigid sequence.”
- Visual: Highlight left-side conveyor/assembly line; add a single arrow.
- VO: “When we needed more throughput, we copied the line—more cores, more servers—but we still glued them together with afterthought queues and shared memory.”
- Visual: Duplicate lines; show locks/contention icons.
- VO: “Modern workloads don’t look like that. They run on many heterogeneous cores and accelerators. We’re leaving single-lane roads for flexible networks.”
- Visual: Pan to center/right; show a grid of pods/workstations with arrows that re-route.
- VO: “Here, work starts when data arrives. It’s dataflow, not a central clock, that drives execution.”

## Scene 3 – Pi/Rho Calculus: Messaging in the Type System (2:00–3:30)
- VO: “Most languages bolt messaging on as libraries—Kafka, RabbitMQ. The type system can’t see those protocols, so you can’t prove you’re race-free or deadlock-free.”
- Visual: Draw a code block labeled ‘C++/Java/Rust’ with a queue off to the side; stamp ‘invisible to types’.
- VO: “Pi calculus, and its rho variant behind Rholang, make messages and channels first-class. The type system sees communication. The compiler can check the protocol.”
- Visual: Processes as dots, channels as edges; stamp ‘type-checked’ on the channel.
- VO: “That shifts concurrency from ‘hope and test’ to ‘design and verify.’”
- VO: “Network-Conscious Pi goes further: it ties the model to physical topology. Peers can join, leave, and self-assemble, and the calculus accounts for it.”
- Visual: Nodes appearing/disappearing; topology morphs.

## Scene 4 – Correctness by Construction (3:30–4:45)
- VO: “Think bridge trusses. Euler gave us compression math; Navier gave us tension. Engineers could see structural risks before building.”
- Visual: Lower-right truss panel; show a deforming truss vs. a stable one.
- VO: “Behavioral types do that for concurrent software. They’re the math; the compiler is the inspector.”
- VO: “Deadlocks, races, protocol violations—caught in design time, not production.”
- Visual: Overlay ‘deadlock? fail’ on a channel; then ‘safe’ after a type check.

## Scene 5 – Deeper Dive: What Behavioral Types Check (4:45–5:45)
- VO: “Behavioral types can assert: this process never deadlocks; these channels carry specific message shapes; this protocol always terminates; these resources are used linearly so no two writers collide.”
- VO: “Because messages are typed, you state these properties in code and have the compiler enforce them.”
- Visual: Checklist bubbles next to a typed channel.

## Scene 6 – Performance & Dataflow Silicon Fit (5:45–7:00)
- VO: “Chips stopped getting faster clocks; they got massively parallel. Specialized cores do different jobs—vector multiply here, hypervector XOR there.”
- Visual: Icons of different cores labeled ‘vector’, ‘hash’, ‘HDC’; arrows fanning out from a dispatcher.
- VO: “Pi/rho were designed for this: spawn many processes, route messages, keep all cores busy without stepping on each other.”
- VO: “This maps to modern dataflow silicon: TPUs, IPUs, wafer-scale engines—work fires when data is ready, not when a program counter advances.”
- Visual: Data tokens triggering compute tiles.

## Scene 7 – Fault Tolerance and Scaling (7:00–8:00)
- VO: “Our goal: Byzantine fault tolerance with crash-fault-like speed. When communication is typed, we can pipeline consensus, isolate faulty nodes, and keep throughput high.”
- Visual: Network diagram; one node marked faulty and quarantined; throughput gauge rising.
- VO: “On scaling, we pursue CAPs-aware, consensus-neutral sharding so domains interoperate without a single bottleneck.”
- Visual: Multiple shards linked by message bridges.

## Scene 8 – Machine Intelligence, Neurosymbolic Track (8:00–9:15)
- VO: “Our AI path is neurosymbolic: combine classic reasoning with modern accelerators. With MetaIL, agents mint domain-specific languages that already encode behavioral types.”
- Visual: Symbols plus neural squiggles merging; ‘DSL’ tickets feeding into code.
- VO: “Those DSLs compile to Rholang, so AI workflows inherit the same message-first guarantees and can run on-chain or off-chain.”
- VO: “Result: AI pipelines stay correct and efficient, and can target the same dataflow hardware.”

## Scene 9 – Tools, Systems, Services (9:15–9:45)
- VO: “Around this, Firefly provides tools and services: design visually, verify with behavioral types, debug with concurrency insight, and deploy on modern dataflow silicon to hit BFT performance targets.”
- Visual: Eye/design/bug/gear icons lit; stamp ‘behavioral types’ near them.

## Scene 10 – Close (9:45–10:10)
- VO: “We move teams from ad-hoc concurrency to provable, message-first systems built for today’s silicon and tomorrow’s networks. If you’re scaling blockchains, AI runtimes, or any high-concurrency backend, let’s talk.”
- Visual: Return to full board; highlight the Firefly butterfly.

## Optional 60–90s Insert (Extra Technical Depth)
- VO: “Concrete behavioral-type checks: (1) Deadlock freedom via session/behavioral types—no cyclic waits. (2) Race freedom via linear/affine channel use—no double writers. (3) Protocol adherence—call order is enforced by types, not convention. (4) Progress/termination for specific protocols—no infinite stalls. These are expressed on channels and processes, then enforced by the compiler.”
- Visual: Four quick panels with each guarantee stamped ‘checked’.
