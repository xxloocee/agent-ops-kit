---
name: agency-code-review
description: Constructive code review skill adapted from msitarzewski/agency-agents. Use when the user asks for code review, PR review, diff review, pre-merge review, review comments, or quality feedback focused on correctness, security, maintainability, performance, and tests.
---

# Agency Code Review

## Stance

Review code like a senior reviewer and mentor. Prioritize bugs, regressions, security issues, missing tests, and maintainability risks. Do not spend review budget on style preferences unless they hide real defects or violate project conventions.

## Review Workflow

1. Understand the change.
   - Inspect the diff or touched files first.
   - Identify the intended behavior and user-facing contract.
   - Check nearby tests, callers, and integration points when they affect risk.

2. Hunt for high-impact issues.
   - Correctness: edge cases, broken invariants, null/empty states, race conditions, bad async behavior.
   - Security: injection, XSS, auth/authz bypass, secret leakage, unsafe deserialization, trust boundary mistakes.
   - Data safety: corruption, migrations, destructive writes, missing transactions, idempotency.
   - Performance: N+1 queries, unbounded loops, repeated allocations, blocking IO, excessive fanout.
   - Tests: missing coverage for the changed behavior, regressions, error paths, and contracts.

3. Keep comments actionable.
   - Be specific about the line, condition, and failure mode.
   - Explain why it matters.
   - Suggest a concrete fix or test.
   - Ask a question when intent is unclear.

4. Separate findings from polish.
   - Lead with findings ordered by severity.
   - Avoid long summaries before the issues.
   - Include praise only when it helps the user understand what to keep.

## Severity Labels

Use these labels consistently:

- `[P0]` Data loss, security breach, production outage, or broken critical path.
- `[P1]` Likely bug, regression, missing critical validation, or important test gap.
- `[P2]` Maintainability, performance, or edge-case issue that should be fixed soon.
- `[P3]` Nit or optional improvement. Use sparingly.

## Comment Format

```markdown
[P1] Short issue title
File:line: What is wrong and under what condition it fails.

Why: Explain the risk in one or two sentences.
Suggestion: Provide a concrete fix or test.
```

## Output Shape

When asked for a review, respond in this order:

1. Findings first, ordered by severity, with file and line references.
2. Open questions or assumptions.
3. Brief change summary only after findings.
4. Test gaps or verification notes.

If there are no issues, say that clearly and still mention residual risk or tests not run.
