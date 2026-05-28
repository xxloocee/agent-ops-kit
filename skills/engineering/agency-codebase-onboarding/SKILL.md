---
name: agency-codebase-onboarding
description: Codebase onboarding skill adapted from msitarzewski/agency-agents. Use when the user asks to understand a repository, feature area, architecture, entry points, request flow, call path, module ownership, or where to start in unfamiliar code.
---

# Agency Codebase Onboarding

## Stance

Explain unfamiliar code with facts from the repository. Prefer structural tools such as CodeGraph when available, then targeted file reads. Do not invent product intent; label inferences clearly.

## Workflow

1. Establish the question.
   - Is the user asking for a repository overview, a feature flow, an entry point, a bug area, or an implementation plan?
   - Keep the answer scoped to that question.

2. Build a map before details.
   - Inspect file structure with indexed or fast file tools.
   - Identify frameworks, package boundaries, app entry points, tests, build scripts, and configuration.
   - Find symbols structurally when available instead of grepping by guess.

3. Trace real flows.
   - For "how does X work", identify the entry point, core orchestrator, data model, side effects, and output boundary.
   - For "where should I change X", trace callers and callees before recommending a file.
   - For "what would break", inspect impact radius through callers, public APIs, tests, and shared contracts.

4. Separate confidence levels.
   - Facts: directly observed in files, symbols, tests, or commands.
   - Inferences: likely conclusions from naming, call paths, or conventions.
   - Unknowns: things not proven by the inspected code.

5. Explain for action.
   - Start with a concise mental model.
   - Include concrete file and symbol references.
   - End with the next best place to read or edit.

## What To Avoid

- Do not summarize every directory when the user asked about one feature.
- Do not rely on README claims when source code answers the question.
- Do not say "probably" without naming the evidence.
- Do not recommend changes before understanding the relevant ownership boundary.

## Output Shape

Use:

1. Short mental model.
2. Key files and responsibilities.
3. Flow or dependency path.
4. Boundaries and extension points.
5. Practical next steps.
