# Architecture

This repository is a personal agent operations kit, not a runtime platform. The
first design goal is retrieval, reuse, and clear ownership boundaries.
Automation is added only after a capability is stable and repeatedly used.

## Domains

- Registry: searchable metadata and import status.
- Skills: standalone instruction packages that are small enough to own locally.
- Plugins: indexed external bundles with manifests and package boundaries.
- MCP: tool server/client notes, launch commands, and safe example configs.
- Workflows: repeatable procedures that compose skills, agents, MCP tools, and
  templates.
- Agents: reusable roles and collaboration protocols.
- Templates: reusable prompt, report, ADR, PR, and checklist shapes.
- Inventory: local discovery output and import candidate decisions.

## Dependency Direction

Workflows may depend on skills, agents, prompts, templates, plugins, and MCP.
Skills should stay portable and avoid depending on a workflow. Plugins may
package skills or MCP config, but shared skills should not depend on one plugin
unless the platform dependency is explicit.

## Import Policy

Start with an inventory entry. Promote to the registry only when the capability
is intentionally kept.

Small, text-centered, highly customized assets can be imported as concrete local
content: skills, templates, prompts, role definitions, and small personal
workflows.

Large external systems should be indexed instead of copied: plugins, MCP
servers, complete workflow frameworks, CLIs, and solution repositories with
their own runtime or release lifecycle. Keep a local note that explains when to
use the solution, what upstream version was checked, and what local boundary
applies.

Copy only the files required for local ownership and keep license or source
notes with imported third-party material.
