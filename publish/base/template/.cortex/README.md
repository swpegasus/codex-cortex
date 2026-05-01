# Cortex State

This folder keeps AI-assisted continuity state separate from project source files.

## Files

- `STATE.md` - current project state and next step.
- `RECOVERY.md` - safe resume process and gates.
- `WORKLOG.md` - public decisions, assumptions, evidence, and open questions.
- `LEARNINGS.md` - failed approaches, caveats, compatibility notes, and do-not-repeat lessons.
- `SESSIONS.md` - dated session history.
- `TASKS.md` - active, blocked, later, and completed work.
- `GUIDE.md` - coding-thread operating guide.
- `RULES.md` - portable project/user instructions.
- `meta.json` - optional machine-readable index.
- `mcp-tools.json` - draft MCP tool contract.
- `archive/` - dated archived state when current files get large.

## Source Of Truth

When files disagree:

1. `../AGENTS.md` wins for operating rules and safety gates.
2. `../START_HERE.md` wins for immediate startup instructions.
3. `STATE.md` wins for current project state.
4. `TASKS.md` wins for task status.
5. `WORKLOG.md` wins for decisions, assumptions, evidence, and open questions.
6. `LEARNINGS.md` wins for failed approaches, caveats, compatibility notes, and do-not-repeat lessons.
7. `SESSIONS.md` wins for dated historical milestones.

When a conflict is found, update the stale file instead of silently choosing one.

## Blocking Questions

If a run must stop for user input, the waiting request must be the last thing posted and should use this visually distinct format:

```text
Waiting for your response:
[single clear question or requested decision]
```

## Tooling Note

Markdown files remain the human-readable source of truth. JSON files are optional discovery aids for agents, prompts, threads, MCP servers, validation scripts, or workflow tools.
