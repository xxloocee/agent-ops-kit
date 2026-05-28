# agent-ops-kit

Personal capability repository for skills, plugins, MCP servers, workflows,
agent roles, and reusable prompts.

The repository follows a lightweight registry-first architecture:

- `registry/` is the source of truth for what capabilities exist.
- `skills/` stores standalone skills that can be copied or installed.
- `plugins/` stores personal plugin packages and plugin notes.
- `mcp/` stores MCP server/client notes and safe example configs.
- `workflows/` stores repeatable multi-step operating procedures.
- `agents/` stores reusable roles, teams, and handoff protocols.
- `templates/` stores reusable documents, prompts, and report shapes.
- `inventory/` stores local discovery results and import candidates.

Do not commit secrets, real tokens, or machine-specific private config.
Use `*.example.*` files for configuration examples.

## Content Policy

Store concrete content when the capability is small, text-centered, and strongly
customized for personal agent behavior:

- `skills/`
- `templates/`
- `prompts/`
- `agents/roles/`
- small personal workflows

Use index-only entries for large external systems with their own runtime,
installation flow, or release lifecycle:

- plugins
- MCP servers
- external workflow frameworks
- complete solution repositories such as gstack or OpenSpec

If a large external solution contains one piece that becomes a personal,
independently reusable capability, extract only that piece and record its
upstream source in the registry.

## Common Commands

```powershell
npm run validate
npm run discover:local
```

`npm run discover:local` scans known local Codex and agent locations and prints
a redacted JSON inventory. It does not copy installed capabilities.

## Import Flow

1. Add a candidate to `registry/capabilities.json`.
2. Choose `imported`, `reference`, or `index-only`.
3. Copy only small customized content that is meant to be owned locally.
4. For large external systems, create a short index note instead of vendoring.
5. Keep source attribution and license notes when importing third-party content.
6. Run `npm run validate`.
7. Document any non-obvious decision in `docs/adr/`.
