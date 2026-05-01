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
