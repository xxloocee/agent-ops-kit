# Astra / Sol Dev

Coordinates complex development and review through dedicated model roles:
GPT 6 Astra designs and reviews; GPT 6.1 Sol implements changes. Use for coupled
changes, architectural decisions, difficult debugging, or substantial reviews,
or when explicitly requested. Simple tasks stay with the current agent.

- Entry point: [SKILL.md](SKILL.md).
- Dependencies: subagent tools supporting explicit model selection,
  `gpt-6-astra`, and `gpt-6.1-sol`.
- Inputs: task intent, repository location, applicable project rules, and
  necessary context from the preceding stage.
- Outputs: a scoped plan, implementation when requested, and independent review
  findings. Design-only and review-only requests run only the relevant role.
- Boundaries: one implementation agent edits at a time; stop if required models
  or subagent capabilities are unavailable. Project verification and approval
  rules still apply.

Imported unchanged from `local:codex-skills/astra-sol-dev` on 2026-10-16.
The model dependency is intentional; no upstream repository is recorded.
