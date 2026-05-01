# AGENTS.md - Codex Cortex

## Project Goal

Codex Cortex is a project-local continuity and handoff system for AI-assisted software work. It provides short, readable project state files that future Codex threads, reusable prompts, external agents, MCP tools, workflow automation, or human maintainers can use to resume safely.

The repository is intended to become publishable on GitHub and later support MCP/n8n-style integrations through narrow, auditable read/write operations.

## User Rules

- Keep code and documentation organized by role and responsibility.
- Keep documentation human-readable and audit-friendly.
- Do not store private chain-of-thought in project files.
- Do not compile, upload, deploy, publish, or run risky automation unless the user explicitly asks or says `go`.
- For this project, publishing to GitHub is allowed when credentials/tooling are available, but do not invent credentials or bypass missing authorization.

## Code Organization

- Keep code commented where behavior is not obvious.
- Organize code by role and responsibility.
- Prefer cohesive, flexible abstractions over fragmented duplicates.
- Avoid separate classes or functions for near-identical behavior when one clear abstraction with flexible arguments can cover the same need.
- Split future implementation into role-based areas such as installer, validator, metadata, MCP server, workflow integration, and documentation.

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
