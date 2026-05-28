# gstack

## Role

External workflow solution for AI-assisted engineering. Treat it as a platform
that can provide planning, review, browser QA, shipping, and multi-agent style
workflows.

## Repository

- Upstream: https://github.com/garrytan/gstack
- Import strategy: `index-only`
- Checked commit: `19770ea8b41da3e79c510a2c80d1aad3f34d4075`
- Last checked: 2026-05-28

## Local Policy

Do not vendor the full repository here. Keep local notes, adapters, and selected
custom workflow wrappers only when they are intentionally customized for this
repository.

Do not split gstack into many local skills by default. Its value is the combined
workflow and tool layer, not isolated prompt fragments.

## When To Use

- End-to-end engineering workflows.
- Browser-based QA and evidence gathering.
- Planning and review orchestration.
- Ship, canary, benchmark, and release assistance.

## Boundary

Use local imported skills for stable personal behavior. Use gstack as an
external solution reference when the task needs its broader runtime, CLI, or
tooling assumptions.

