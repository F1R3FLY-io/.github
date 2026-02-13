# Cloud Service Parallels: CFT to BFT

## Purpose

This document provides a portfolio-level, abductive comparison between conventional cloud service categories (AWS, Azure, GCP) and conceptual F1R3FLY equivalents.

It is intended for system integrators (SIs) comparing:

- cloud-native, Crash Fault Tolerant (CFT) operating assumptions, and
- F1R3FLY-oriented, Byzantine fault tolerant (BFT) design assumptions.

## Scope and Method

- Comparisons are conceptual equivalents, not 1:1 product substitutions.
- Mappings are category-level and architecture-level (not SKU-level).
- Claims are constrained to currently documented capabilities and repository metadata.
- Private F1R3FLY repositories are included by name only (no private URLs).

## Comparison Table

| Capability Category | AWS Baseline | Azure Baseline | GCP Baseline | F1R3FLY Conceptual Equivalent | Fault-Model Emphasis (CFT -> BFT) | Visibility |
|---|---|---|---|---|---|---|
| Object/data storage service | S3 | Blob Storage | Cloud Storage | `f1r3drive`, `f1r3drive-extension` | Move from centralized durability assumptions toward decentralized storage-access patterns in adversarial environments. | Public |
| Compute/node runtime | EC2 | Virtual Machines | Compute Engine | `f1r3node`, `f1r3node-rust`, `pyf1r3fly`, `rust-client` | Move from host/zone resilience assumptions toward BFT-capable transaction/node behavior under arbitrary faults. | Public |
| Infrastructure automation and provisioning | CloudFormation/CDK | ARM/Bicep | Deployment Manager/OpenTofu workflows | `IaC`, `F1r3bu1ld3r`, `system-integration` | Move from infrastructure consistency and failover to coordinated multi-node deployment patterns with BFT posture goals. | Public |
| API and service gateway layer | API Gateway | API Management | API Gateway | `embers`, `f1r3sky-backend` | Move from API uptime/rate-control focus toward API surfaces backed by BFT-oriented service composition. | Public |
| Application platform layer | ECS/EKS app stacks | AKS app stacks | GKE app stacks | `embers-frontend`, `f1r3sky`, `f1r3sky-client`, `f1r3wallet`, `f1r3bot` | Move from app HA on CFT infrastructure toward apps built on BFT-ready runtime and messaging assumptions. | Public |
| Messaging and event coordination | SQS/SNS | Service Bus/Event Grid | Pub/Sub | `rholang`, `rholang-rs`, `graphl-parser` | Move from queue/topic reliability toward message-first process coordination where adversarial behavior is an explicit design concern. | Public |
| Access Control with Identity, permissions, and policy controls | IAM | Entra ID + IAM | Cloud IAM | `F1r3 CAPS`, `OSLF`, `OSLF-editor` | Move from role/ACL-centric controls toward tokenized/capability-based authorization and formalized behavioral constraints. | Public (with platform concept) |
| Language/tooling for correctness and integration safety | Code-level lint/test stacks | Code-level lint/test stacks | Code-level lint/test stacks | `OSLF`, `MeTTaIL`, `mettail-rust`, `MeTTa-Compiler`, `MeTTaCycleYellowPaper` | Move from post-hoc defect detection toward stronger correctness/semantics tooling in distributed settings. | Public |
| Developer productivity and integration tooling | Cloud IDE/tool ecosystem | Cloud IDE/tool ecosystem | Cloud IDE/tool ecosystem | `rholang-language-server`, `rholang-vscode-client`, `rholang-nvim`, `rholang-emacs-client`, `lightning-bug` | Move from generic editor productivity toward domain-specific tooling for message-first distributed engineering. | Public |
| Observability and flow analysis | CloudWatch | Azure Monitor | Cloud Monitoring | `Sankey_block_explorer`, `system-integration` | Move from service metrics/log-centric operations toward topology/flow-aware analysis for distributed transaction systems. | Public |
| Governance/process and release controls | Organizations/Config/Control frameworks | Management Groups/Policy | Org Policy/Folders | `FIPS`, `fflip`, `.github` | Move from policy enforcement in CFT clouds toward governance for BFT-oriented platform evolution and integration standards. | Public |
| Strategic or specialized extension portfolio | Specialized managed products | Specialized managed products | Specialized managed products | `f1r3fly-rgb`, `f1r3fly-rgb-wallet`, `Rholang-RGB`, `F1R3FLY.ai`, `Singularity-Scale`, `SNETPackages`, `Branding`, `CorporateDocuments`, `dev.github.io`, `skein` | Private initiatives support targeted extensions around finance, AI, partner delivery, and organization operations beyond public base portfolio. | Private |

## SI Notes for Abductive Analysis

1. Start with capability intent, not service SKU matching.
2. Treat each row as "closest architectural analogue under different trust/fault assumptions."
3. Assume integration layering: public portfolio for implementation path, private portfolio for strategic or governed extensions.
4. Evaluate where CFT assumptions are sufficient versus where BFT assumptions are required by threat model, trust boundary, or cross-organization coordination.

## Guardrails

- Do not represent these mappings as drop-in replacements.
- Do not publish private repository links in partner-facing materials.
- Use canonical repository naming from `docs/Organization_of_Repositories.md`.

---

Last updated: 2026-02-13
