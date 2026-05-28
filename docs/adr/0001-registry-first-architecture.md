# ADR-0001: Registry-First Capability Repository

## Status

Accepted

## Context

The repository needs to store personal skills, plugins, MCP servers, workflows,
agent roles, and prompts without becoming a heavy platform too early.

## Options

- Pure documentation repository: simplest, but hard to search and validate as it
  grows.
- Registry plus lightweight validation: still simple, but gives unique IDs,
  status, tags, and path checks.
- Full CLI/package manager: powerful, but premature before import patterns are
  stable.

## Decision

Use a registry-first structure with `registry/capabilities.json` as the source
of truth and a dependency-free validation script.

## Consequences

The repository can stay portable and easy to inspect. Automation can be added
later once capability import and reuse patterns are proven.

