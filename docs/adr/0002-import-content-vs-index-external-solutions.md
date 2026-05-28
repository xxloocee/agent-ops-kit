# ADR-0002: Import Local Assets And Index External Solutions

## Status

Accepted

## Context

The repository stores both small personal assets and references to larger
external systems. Treating all of them the same would either hide important
personal behavior behind links or vendor large upstream projects that have their
own lifecycle.

## Options

- Import everything: easy to browse locally, but creates version drift,
  licensing noise, and a large repository.
- Index everything: clean and small, but weak for skills and templates that are
  meant to be customized and reused directly.
- Import small local assets and index large external systems: more deliberate,
  but preserves ownership boundaries.

## Decision

Import concrete content for small, text-centered, customized assets such as
skills, templates, prompts, roles, and small personal workflows.

Use index-only registry entries for plugins, MCP servers, external workflow
frameworks, CLIs, runtime packages, and complete solution repositories such as
gstack and OpenSpec.

## Consequences

The repository stays useful without becoming a mirror of external projects. If a
large solution contains a small piece that becomes independently useful, extract
only that piece as a local asset and record its upstream source.
