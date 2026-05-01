# AGENTS.md - <PROJECT_NAME>

## Project Goal

<Describe the project goal in one or two paragraphs.>

## User Rules

- <Add project-specific user rules.>
- <Add build, test, run, upload, deploy, and publish approval gates.>
- Do not compile, upload, deploy, publish, or run risky automation unless the user explicitly asks or says `go`.

## Code Organization

- Keep code commented where behavior is not obvious.
- Organize code by role and responsibility.
- Prefer cohesive, flexible abstractions over fragmented duplicates.
- Avoid separate classes or functions for near-identical behavior when one clear abstraction with flexible arguments can cover the same need.
- Split code into role-based areas such as network, display, interrupts, storage, power, UI, diagnostics, and project-specific systems.

## Cortex State

Keep project continuity under:

- `.cortex/`

Update Cortex files when meaningful state changes:

- `.cortex/STATE.md`
- `.cortex/RECOVERY.md`
- `.cortex/WORKLOG.md`
- `.cortex/LEARNINGS.md`
- `.cortex/TASKS.md`
- `.cortex/SESSIONS.md`

`WORKLOG.md` and `LEARNINGS.md` are public project state. They are not private chain-of-thought.

## Recovery Order

1. `START_HERE.md`
2. `AGENTS.md`
3. `.cortex/README.md`
4. `.cortex/STATE.md`
5. `.cortex/WORKLOG.md`
6. `.cortex/LEARNINGS.md`
7. `.cortex/SESSIONS.md`
8. `.cortex/TASKS.md`
9. `.cortex/RECOVERY.md`
10. `.cortex/GUIDE.md`
11. `.cortex/RULES.md`

## Autonomous Learning Rule

Agents, reusable prompts, and normal threads should update `.cortex/LEARNINGS.md` during work when they discover durable project knowledge future runs should not have to rediscover. This does not require a separate user prompt.

Record concise public learnings such as:

- failed approaches and why they failed
- commands, quoting, path, shell, or platform details required to make things work
- repeated friction points
- compatibility constraints
- setup requirements
- debugging checks that exposed the real issue
- patterns that should not be repeated

Do not store private chain-of-thought. Record the useful conclusion, evidence, and better next action.

## Documentation Rule

Create separate technical documentation only when asked, when creating checkpoints, or when documentation is explicitly part of the task. Documentation should help someone take over the project without prior chat history.
