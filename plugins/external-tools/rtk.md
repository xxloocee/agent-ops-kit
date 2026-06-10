# RTK

## Role

External CLI proxy and agent integration tool for reducing token-heavy command
output before it enters an AI coding session. Treat it as a command-output
compression layer for development tools, not as a replacement for the tools
themselves.

## Repository

- Upstream: https://github.com/rtk-ai/rtk
- Import strategy: `index-only`
- Checked commit: `6785a6c7695d7273e722214a295249a84819b6f0`
- Checked branch: `develop`
- Last checked: 2026-06-10
- License: Apache 2.0

## Local Policy

Do not vendor the Rust source, generated binaries, install script, hook files,
or agent adapters into this repository. RTK has its own release lifecycle,
installation paths, telemetry controls, and per-agent integration behavior.

Keep this repository responsible for the index entry and local trust boundary.
Only add small adapter notes if a specific Codex, Claude, Cursor, or other
agent setup is intentionally customized for personal use.

## When To Use

- Shell commands that produce verbose output, especially `git`, `rg`, `grep`,
  test runners, build tools, package managers, Docker, Kubernetes, and AWS.
- Long coding sessions where command output would otherwise consume excessive
  LLM context.
- Environments where an agent hook or plugin can rewrite commands to `rtk`
  equivalents.
- Manual calls such as `rtk git status`, `rtk read`, `rtk grep`, or
  `rtk test <cmd>` when auto-rewrite is unavailable.

## Boundary

RTK filters command output. It does not own project workflow state,
requirements, plans, reviews, or release gates. On native Windows, auto-rewrite
support is limited, so explicit `rtk` commands or WSL may be required.

Before installation, verify name collision risk: `rtk-ai/rtk` is Rust Token
Killer, distinct from other projects named `rtk`.
