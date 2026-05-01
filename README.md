# Codex Cortex

Codex Cortex is a project-local continuity and handoff system for AI-assisted software work.

It gives a project a small, readable memory layer so future Codex threads, reusable prompts, external agents, MCP tools, workflow automation, or human maintainers can understand what happened, what failed, what still needs work, and what rules must be followed.

Codex Cortex is documentation-first. It does not compile, upload, deploy, publish, install dependencies, contact outside services, or modify source code by itself.

## What It Creates

When installed into a project, Codex Cortex creates this compact structure:

```text
<project>/
  AGENTS.md
  START_HERE.md
  .cortex/
    README.md
    STATE.md
    RECOVERY.md
    WORKLOG.md
    LEARNINGS.md
    SESSIONS.md
    TASKS.md
    GUIDE.md
    RULES.md
    meta.json
    mcp-tools.json
    archive/
```

## Naming Scheme

The installed state folder is named `.cortex` because it acts as the project-local memory, recovery, and coordination layer.

The installed file names are intentionally short:

- `STATE.md` instead of `CURRENT_STATE.md`
- `RECOVERY.md` instead of `RECOVERY_PLAYBOOK.md`
- `WORKLOG.md` instead of `STREAM_OF_THOUGHT.md`
- `LEARNINGS.md` for durable failures and do-not-repeat notes
- `SESSIONS.md` instead of `SESSION_LOG.md`
- `TASKS.md` instead of `TODO.md`
- `RULES.md` instead of `CUSTOM_INSTRUCTIONS.md`

See `docs/STRUCTURE.txt` for the full naming rationale.

## Why It Exists

AI coding threads often lose useful context across sessions. Codex Cortex keeps that context in the project instead of relying on chat history.

It is designed to preserve:

- project rules and approval gates
- current project state
- recovery steps
- dated session history
- active and blocked tasks
- public decisions and evidence
- failures and do-not-repeat lessons
- prompt, thread, and agent operating rules
- optional metadata for MCP or workflow tooling

## Core Rules

- Keep continuity scoped to the current project.
- Keep source code and Cortex state separate.
- Do not store private chain-of-thought.
- Record public conclusions, evidence, failed approaches, and next steps.
- Do not compile, upload, deploy, publish, or run risky automation unless the project rules explicitly allow it or the user says `go`.
- Agents, reusable prompts, and normal threads should update `.cortex/LEARNINGS.md` when they discover durable lessons future runs should not repeat.

## Quick Start

1. Copy the contents of `template/` into your target project root.
2. Replace placeholders like `<PROJECT_NAME>`, `<PROJECT_ROOT>`, and `<YYYY-MM-DD>`.
3. Read and customize `AGENTS.md`.
4. Read and customize `START_HERE.md`.
5. Fill in `.cortex/STATE.md`, `.cortex/TASKS.md`, and `.cortex/RECOVERY.md`.
6. Run the validator if you want a read-only structure check:

```powershell
.\tools\Validate-Cortex.ps1 -ProjectRoot "<PROJECT_ROOT>"
```

The validator reports missing files, unresolved placeholders, and safety-gate terms. It does not write files.

## Optional Installer

The installer copies the template into a project:

```powershell
.\tools\Install-Cortex.ps1 -ProjectRoot "<PROJECT_ROOT>"
```

Use `-Force` only when you intentionally want to overwrite existing Cortex files.

## File Guide

| File | Purpose |
| --- | --- |
| `AGENTS.md` | Project rules, safety gates, recovery order, and autonomous learning rule. |
| `START_HERE.md` | First file future runs should read. |
| `.cortex/STATE.md` | Current project phase, source folders, verified state, and next step. |
| `.cortex/RECOVERY.md` | Safe resume steps and approval gates. |
| `.cortex/WORKLOG.md` | Public decision log, evidence, assumptions, and open questions. |
| `.cortex/LEARNINGS.md` | Failed approaches, caveats, quoting/path issues, compatibility notes, and do-not-repeat lessons. |
| `.cortex/SESSIONS.md` | Dated session history. |
| `.cortex/TASKS.md` | Active, blocked, later, and completed work. |
| `.cortex/GUIDE.md` | Coding-thread operating guide. |
| `.cortex/RULES.md` | Portable user/project defaults. |
| `.cortex/meta.json` | Optional machine-readable project index. |
| `.cortex/mcp-tools.json` | Draft MCP tool contract. |

## Safety Review

For a plain text audit, read:

- `docs/FUNCTION.txt`
- `docs/SAFETY.txt`
- `docs/STRUCTURE.txt`
- `tools/Validate-Cortex.ps1`
- `tools/Install-Cortex.ps1`

The package is intentionally transparent: most files are Markdown or plain text templates, and the scripts are short PowerShell utilities.

## Future Direction

Codex Cortex is structured so it can later become:

- a reusable prompt package
- a Codex skill or plugin
- an MCP server
- an n8n workflow component
- a project handoff standard for mixed human and AI teams

The first automation target should be read-only validation. Narrow write tools for tasks, work logs, session logs, and learnings can come later.

## Before Publishing

- Choose a license before making the repository public.
- Review `docs/SAFETY.txt`.
- Review both PowerShell tools.
- Replace or remove any project-specific placeholders if publishing a customized copy.
- Keep helper scripts narrow and auditable.
