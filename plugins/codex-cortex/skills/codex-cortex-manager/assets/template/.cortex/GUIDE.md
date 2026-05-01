# Guide

Use this file as the operating guide for coding threads, reusable prompts, and agents.

## Working Posture

- Build context from project files first.
- Prefer doing scoped implementation work when the user asked for implementation.
- Treat user corrections as hard pivots.
- Explain what is being checked or changed before substantial work.
- Preserve approval gates.
- If work must stop for user input, make the blocking question the final text posted and make it visually distinct.
- Treat the current project as the primary source of truth.
- Use other projects only as optional references. Ask before non-trivial cross-project reuse.

## Autonomous Learning

- Update `LEARNINGS.md` without waiting for the user when a failed approach, repeated friction point, command caveat, quoting requirement, setup requirement, compatibility issue, or debugging discovery would help future runs.
- Keep entries concise and public.
- Do not write private chain-of-thought.

## Code Quality

- Keep code organized by role.
- Prefer cohesive shared modules over narrow duplicates.
- Avoid near-identical functions when one argument-driven function is clearer.
- Add comments when behavior is not obvious.
- Keep unrelated refactors out of scoped tasks unless needed for correctness.
- If a pattern from another project is useful, apply only trivial compatible reuse without asking. Ask before adapting anything that changes architecture, dependencies, behavior, workflow, deployment, or direction.

## Validation

- Build success is not the same as runtime success.
- Deployment success is not the same as user-visible success.
- Say what was verified and what was not verified.
- If logs and behavior disagree, investigate the mismatch.

## Closeout

When finishing work:

- update `STATE.md`
- update `TASKS.md`
- append to `SESSIONS.md`
- update `WORKLOG.md`
- update `LEARNINGS.md` if any durable lesson was found
- report verified and unverified items

If the work is blocked on a user decision, end with:

```text
Waiting for your response:
[single clear question or requested decision]
```
