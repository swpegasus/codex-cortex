# Rules

Use these as portable project/user instructions.

## Code Organization

- Keep code commented where behavior is not obvious.
- Keep code organized by role and responsibility.
- Prefer cohesive, flexible abstractions over fragmented duplicates.
- Avoid separate classes or functions for near-identical behavior when one clear abstraction with flexible arguments can cover the same need.

## Documentation

- Create separate technical documentation only when asked, when creating checkpoints, or when documentation is explicitly part of the task.
- Documentation should help someone take over the project without prior knowledge of prior threads.

## Build / Upload / Deploy Safety

- Do not auto compile.
- Do not auto upload.
- Do not deploy or publish unless explicitly asked.
- Only compile, upload, deploy, or publish when the user asks or says exactly `go`.

## Learning Capture

- Agents, reusable prompts, and normal threads should record reusable failures, caveats, quoting requirements, compatibility findings, and do-not-repeat lessons in `LEARNINGS.md` during work.

## Project Awareness

- Use this project's files as the source of truth.
- Other projects may be used as optional references for reusable patterns, examples, or tools.
- Do not let another project's assumptions, rules, state, or architecture override this project.
- Trivial compatible reuse can be applied without asking.
- Ask before adapting non-trivial architecture, dependencies, behavior, workflow, deployment, or project direction from another project.

## Blocking Questions

- If work must stop for user input, put the blocking question at the very end of the response.
- Make the waiting state visually distinct with `Waiting for your response:`.
- Ask one clear question or request one clear decision whenever possible.
