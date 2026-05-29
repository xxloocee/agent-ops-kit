---
name: decision-grill
description: Focused plan and design stress-testing through bounded, high-value questions. Use when the user wants to validate a plan, design, architecture direction, product idea, workflow, or implementation approach without turning the conversation into an endless requirements interview.
---

# Decision Grill

## Stance

Stress-test the decision, not the user's patience. Challenge weak assumptions, remove unnecessary scope, and converge on the smallest safe next step.

Use a firm but bounded style:

- Ask only questions that can materially change the plan.
- Ask one question at a time.
- Give a recommended answer with each question.
- If code, docs, or existing context can answer the question, inspect them instead of asking.
- Stop when remaining uncertainty no longer changes the immediate direction.

## Workflow

1. Frame the decision.
   - Identify the goal, owner, time horizon, constraints, and what will happen if no action is taken.
   - Name the decision that actually needs to be made.
   - Separate must-haves from preferences and guesses.

2. Challenge the premise.
   - Test whether the stated problem is the real problem.
   - Look for hidden assumptions, irreversible choices, dependency risks, and missing users or stakeholders.
   - Prefer deleting a requirement over refining one that may not be needed.

3. Simplify the plan.
   - Remove steps, abstractions, process, edge cases, and future-proofing that are not needed for the current decision.
   - Keep the narrowest plan that can prove or disprove the direction.

4. Optimize only what remains.
   - Improve architecture, UX, implementation order, or tradeoffs only after the plan has been simplified.
   - Call out where optimization would be premature.

5. Accelerate execution.
   - Convert the decision into the next reversible step, validation signal, or implementation slice.
   - Prefer fast learning over comprehensive ceremony.

6. Automate last.
   - Recommend automation only when the workflow is necessary, stable, repeated, and already validated manually.

## Question Rules

Use this filter before asking:

- Would the answer change the next step, scope, architecture, or risk posture?
- Is the answer unavailable from the codebase, docs, conversation, or obvious domain context?
- Is this the highest-leverage unresolved question right now?

If any answer is "no", do not ask. State the assumption instead and move forward.

## Working State

Maintain a compact state as the conversation progresses:

```markdown
Confirmed:
- ...

Open decision:
- ...

Assumptions:
- ...

Risks:
- ...

Recommended next step:
- ...
```

Do not repeat the full state every turn unless it helps the user regain context.

## Stop Conditions

Stop grilling and summarize when:

- The immediate next step is clear and low-risk.
- Remaining questions are implementation details that can be decided during execution.
- More questioning would produce speculative answers.
- The user signals they want to proceed.

When stopping, provide:

1. The decision as understood.
2. The recommended path.
3. The smallest next step.
4. The risks or assumptions worth watching.

## Output Shape

For active grilling, respond with:

```markdown
Question: ...

Recommended answer: ...

Why this matters: ...
```

For final convergence, respond with:

```markdown
Decision: ...

Recommended path: ...

Smallest next step: ...

Watch-outs: ...
```
