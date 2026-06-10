# CatPaw

## Role

External cross-session workflow runtime for AI-assisted software projects.
Treat it as a coordination layer for routing work, keeping project artifact
boards, applying provider gates, and closing tasks with verification evidence.

## Repository

- Upstream: https://github.com/shiqkuangsan/catpaw
- Import strategy: `index-only`
- Checked commit: `a96f188c585db7e5ce69fa97a2abc79e9b985df8`
- Last checked: 2026-06-10
- License: MIT

## Local Policy

Do not vendor the full repository or generated runtime package here. CatPaw has
its own source layout, build scripts, runtime manifest, install flow, and
project-local artifact board model.

Keep this repository responsible for the index entry and local usage decision.
Only add adapter notes or customized workflow fragments when they are
intentionally maintained as personal capabilities outside the upstream runtime.

## When To Use

- Cross-session project work where requirements, plans, reviews, tests, or
  lessons need durable artifacts.
- Work that benefits from explicit `L0` / `L1` / `L2` / `L3` routing.
- Tasks that need provider gates, Expert Council roles, or verification records
  before closeout.
- Project board status, doctor, reconcile, migration, upgrade, or closeout
  workflows.

## Boundary

CatPaw decides what workflow should run and where project artifacts live. It
does not replace execution skills, coding agents, model providers, task runners,
or IDE tooling. Use it as the workflow control layer around the current agent
and project, not as a standalone skill.
