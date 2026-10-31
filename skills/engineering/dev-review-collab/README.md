# Dev Review Collab

Coordinates complex development and independent review using the current
session model by default. Independent implementation tasks may run in parallel;
a reviewer who did not author the changes checks the final combined result.
Simple tasks stay with the current agent unless collaboration is explicitly
requested.

- Entry point: [SKILL.md](SKILL.md).
- Dependency: subagent tools for collaboration. If unavailable, report the
  limitation and continue authorized work that can be completed independently.
- Inputs: task intent, repository location, applicable project rules, and
  original materials needed for each role.
- Outputs: a scoped plan, implementation when requested, and independent review
  findings supported by actual code or requirements.
- Boundaries: reviewers are read-only and independent of the authors; avoid
  unnecessary defensive programming. Verification and approval follow user
  instructions and project rules without adding extra gates.

Imported unchanged from `local:codex-skills/dev-review-collab` on 2026-10-31.
No upstream repository is recorded.
