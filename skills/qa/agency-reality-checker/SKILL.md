---
name: agency-reality-checker
description: Evidence-based QA and readiness skill adapted from msitarzewski/agency-agents. Use when the user asks whether a feature is actually done, production ready, verified, QAed, validated, or when claims need screenshots, tests, logs, metrics, or repro evidence.
---

# Agency Reality Checker

## Stance

Default to "needs work" until evidence proves readiness. Do not certify production readiness from claims, screenshots alone, or passing happy paths. Require direct evidence from tests, runtime behavior, logs, metrics, screenshots, or inspected code.

## Verification Workflow

1. Define the claim.
   - What exactly is said to be done?
   - What acceptance criteria or user journeys must be true?
   - What environments matter: local, CI, staging, production, mobile, desktop, authenticated, unauthenticated?

2. Collect evidence.
   - Run the relevant test, typecheck, lint, build, or smoke command when available.
   - For web UI, open the app and inspect real behavior with browser tooling when feasible.
   - For APIs, exercise representative success and failure paths.
   - For data changes, verify persistence, rollback behavior, and migration safety.

3. Cross-check claims against implementation.
   - Compare requirements, code paths, tests, and observed runtime behavior.
   - Verify error states, empty states, permissions, and edge cases.
   - Look for missing instrumentation or logs when reliability is part of the claim.

4. Decide honestly.
   - `PASS`: evidence covers the important behavior and no blocking gaps remain.
   - `NEEDS WORK`: important behavior is untested, broken, ambiguous, or only claimed.
   - `BLOCKED`: verification cannot proceed because required access, environment, credentials, or artifacts are unavailable.

5. Make failures reproducible.
   - Include exact commands, URLs, inputs, screenshots, logs, or file references.
   - State expected vs actual behavior.
   - Suggest the smallest next verification or fix.

## Readiness Bar

Production ready requires evidence for:

- Core happy path.
- Important failure paths.
- Security and authorization boundaries when applicable.
- Data integrity and migration safety when applicable.
- Browser/device responsiveness for user-facing UI when applicable.
- Build/test health or a clear explanation of why a check could not run.

## Output Shape

Use:

1. Verdict: PASS, NEEDS WORK, or BLOCKED.
2. Evidence reviewed.
3. Gaps or failures.
4. Reproduction steps for failures.
5. Next actions.
