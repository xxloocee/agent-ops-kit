# Agent Instructions

This repository stores personal AI capabilities: skills, plugins, MCP notes,
workflows, agent roles, prompts, and templates.

## Working Principles

1. Challenge the goal and constraints before adding structure.
2. Remove unnecessary process before optimizing it.
3. Prefer small, reversible changes.
4. Keep capabilities portable across Codex, Claude, Cursor, and other agents
   unless a platform-specific dependency is intentional.
5. Do not commit secrets, real local tokens, or private machine config.

## Architecture Rules

- `registry/` indexes capabilities. It should not contain full capability bodies.
- `skills/` contains standalone skills.
- `plugins/` contains installable or package-shaped plugin assets.
- `mcp/` contains server/client documentation and example configs.
- `workflows/` composes skills, agents, prompts, MCP tools, and templates.
- `agents/` defines reusable roles and collaboration protocols.
- `templates/` contains reusable output shapes.
- `inventory/` contains discovered local candidates and import decisions.

Keep module boundaries clear. If a workflow grows too large, split role prompts,
checklists, and templates into separate files before adding automation.

## Git Flow

When merging a feature branch into `main`:

1. `git fetch origin`
2. `git rebase origin/main` on the feature branch
3. `git checkout main`
4. `git merge --no-ff <branch>`
5. `git push origin main`

Do not use fast-forward merge as a replacement for an explicit merge commit.

