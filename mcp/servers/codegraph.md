# CodeGraph

## Role

External MCP server and CLI for semantic code intelligence. CodeGraph builds a
local `.codegraph/` index for a repository and exposes symbol search, file
structure, call graph, impact analysis, and task context through CLI commands
and MCP tools.

## Repository

- Upstream: https://github.com/colbymchenry/codegraph
- Import strategy: `index-only`
- Checked commit: `f58de8a391259214729b1e8de3524e9589c5e056`
- Last checked: 2026-05-29
- Local CLI version observed: `0.9.6`

## Local Codex MCP Shape

The local Codex config uses CodeGraph as an MCP server:

```toml
[mcp_servers.codegraph]
command = "codegraph"
args = ["serve", "--mcp"]
```

## Common Commands

```powershell
codegraph init -i
codegraph status
codegraph sync
codegraph serve --mcp
```

## Local Policy

Do not vendor the CodeGraph repository into this project. Keep this file as an
index and operational note. Per-project indexes live in each target repository's
local `.codegraph/` directory and should not be committed.

Use CodeGraph for structural codebase questions: symbol lookup, callers,
callees, impact, file structure, and task-focused context. Use normal text
search for literal strings, comments, logs, and documentation text.

## Trust Boundary

CodeGraph is local code-indexing tooling. It reads project files and creates a
local index. Treat generated indexes as machine-local runtime data.

