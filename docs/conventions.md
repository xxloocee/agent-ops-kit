# Conventions

## Capability IDs

Use lowercase IDs with a type prefix:

- `skill.architecture-review`
- `plugin.my-plugin`
- `mcp.codegraph`
- `workflow.ship`
- `agent.architect`
- `template.adr`

## Status Values

- `candidate`: discovered locally, not yet imported.
- `draft`: imported but still changing.
- `stable`: ready for routine reuse.
- `deprecated`: kept for history, should not be used for new work.

## File Layout

Each imported capability should have a small `README.md` explaining:

- What problem it solves.
- When to use it.
- Required dependencies.
- Inputs and outputs.
- Known risks or trust boundaries.

## Import Strategies

Use one of three strategies:

- `imported`: store the concrete local content because this repository owns the
  adapted behavior.
- `reference`: keep metadata and source information, but do not copy the content.
- `index-only`: track an external solution and a short local note only.

Default to `imported` for customized skills, templates, prompts, role files, and
small personal workflows.

Default to `index-only` for plugins, MCP servers, external workflow frameworks,
CLIs, runtime packages, and complete solution repositories.

## Skill Categories

Group skills by the situation where they are used:

- `skills/architecture/`: architecture and technical direction.
- `skills/design/`: UI, UX, frontend, visual design, and product experience.
- `skills/engineering/`: code understanding, implementation, and refactoring.
- `skills/qa/`: verification, readiness, testing, and evidence gathering.
- `skills/research/`: web research, external-source collection, and discovery.
- `skills/review/`: code review, PR review, and quality gates.

Prefer adding a new category only after at least two capabilities clearly do not
fit the existing set.

## Secrets

Never commit real secrets. Use `config.example.*` and document required
environment variables by name only.

## Upstream Tracking

When importing third-party or community-maintained capabilities, keep a local
copy as the working version and record upstream metadata in the registry:

- `repo`: owner and repository name.
- `url`: repository URL when available.
- `path`: upstream file or directory path.
- `commit`: upstream commit used as the comparison base.
- `last_checked`: date the upstream reference was checked.

Do not auto-overwrite local skills from upstream. Compare, review, and merge
changes intentionally because skill text changes agent behavior.

## External Solutions

Some repositories are complete solutions rather than standalone skills. Examples
include multi-agent platforms, spec-driven development frameworks, browser QA
systems, and deployment orchestration suites.

Track these as `workflow` capabilities with `import_strategy: "index-only"`:

- Keep a short local note under `workflows/external-solutions/`.
- Record upstream repository, commit, and last checked date in the registry.
- Do not copy the whole upstream repository into this repository.
- Do not split the solution into many local skills unless a specific piece is
  customized and used independently.
- Prefer local adapter notes over vendoring upstream implementation files.
