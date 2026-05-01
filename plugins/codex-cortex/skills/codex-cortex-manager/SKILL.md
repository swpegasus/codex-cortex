---
name: codex-cortex-manager
description: Install, validate, update, and maintain Codex Cortex continuity across any project root. Use when a user asks to set up Cortex, install project memory, create AGENTS/START_HERE/.cortex files, validate Cortex structure, check GitHub for updated Cortex tools/templates/skills, preserve durable learnings for future agents or prompts, prepare a project for MCP/n8n workflows, or make Cortex available system-wide to future Codex agents.
---

# Codex Cortex Manager

Use this skill as the cross-project entry point for Codex Cortex. It is not tied to the Codex Cortex repository. It installs and maintains Cortex state in any project root the user identifies.

Codex Cortex provides a central operating pattern for all agents and prompts while keeping each project's actual state local to that project:

- global skill: shared install, validation, and maintenance procedure
- project `.cortex/`: project-specific state, tasks, work log, learnings, and recovery notes
- prompt/reference pack: reusable agent instructions for resume, research, closeout, and install flows

## Core Rules

- Confirm or infer the target project root before installing or editing Cortex files.
- Keep project state scoped to the target project.
- Keep source code and Cortex state separate.
- Do not store private chain-of-thought. Record public conclusions, evidence, failed approaches, caveats, and next steps.
- Record durable failures, repeated setup requirements, quoting/path caveats, compatibility notes, and do-not-repeat lessons in `.cortex/LEARNINGS.md`.
- Do not compile, upload, deploy, publish, or run risky automation unless the project rules explicitly allow it or the user says `go`.
- If work must stop for user input, make the blocking question the final text posted and mark it with `Waiting for your response:`.

## Project Recovery

When a project already has Cortex installed, read these files first:

1. `START_HERE.md`
2. `AGENTS.md`
3. `.cortex/README.md`
4. `.cortex/STATE.md`
5. `.cortex/LEARNINGS.md`
6. `.cortex/TASKS.md`
7. `.cortex/RECOVERY.md`

Then inspect the actual project source before editing.

## Install Into A Project

Use the bundled installer when the target project needs Cortex files:

```powershell
.\scripts\Install-CortexProject.ps1 -ProjectRoot "<PROJECT_ROOT>"
```

Use `-Force` only when the user wants to overwrite existing Cortex files.

After installing, replace placeholders such as `<PROJECT_NAME>`, `<PROJECT_ROOT>`, and `<YYYY-MM-DD>` in the target project. Preserve the user's safety gates and project-specific rules exactly.

## Validate A Project

Run the read-only validator:

```powershell
.\scripts\Validate-CortexProject.ps1 -ProjectRoot "<PROJECT_ROOT>"
```

Interpret placeholder findings by context. Placeholders are expected in the reusable template, but installed project files should be filled in.

## Check For Cortex Updates

Use the update checker to look for newer Codex Cortex framework, plugin, skill, template, docs, prompt, or tool versions:

```powershell
.\scripts\Check-CodexCortexUpdates.ps1
```

The checker may contact GitHub for public manifest, commit, and changelog metadata. It must not download or install updates. Summarize the documented changes and ask before downloading anything.

Download only after explicit approval:

```powershell
.\scripts\Update-CodexCortexFromGitHub.ps1 -ApproveDownload
```

Install only after explicit install approval:

```powershell
.\scripts\Update-CodexCortexFromGitHub.ps1 -ApproveDownload -InstallSystemSkill -ApproveInstall
```

After checking updates, ask whether the user wants a recurring update check automation. Default to 30 days, and let the user choose another interval. The automation may check and summarize updates only; it must not download or install without explicit approval.

## Maintain Existing Cortex State

During work, update Cortex files when the facts change:

- `.cortex/STATE.md` for current status and next step
- `.cortex/TASKS.md` for active, blocked, later, and completed work
- `.cortex/WORKLOG.md` for public decisions, evidence, assumptions, and open questions
- `.cortex/LEARNINGS.md` for reusable failures and do-not-repeat notes
- `.cortex/SESSIONS.md` for dated session summaries
- `.cortex/RECOVERY.md` when safe resume steps or approval gates change

## References

Load only what is needed:

- `references/FUNCTION.txt` - functional overview and source-of-truth rules
- `references/SAFETY.txt` - audit and non-malicious behavior notes
- `references/STRUCTURE.txt` - naming scheme and installed file map
- `references/CODEX_PLUGIN.txt` - plugin packaging and system-skill install behavior
- `references/UPDATES.txt` - GitHub update checks, approval gates, and automation offer
- `references/VERSION.json` - packaged skill source version metadata
- `references/INTEGRATIONS.txt` - MCP, n8n, GitHub, and prompt guidance
- `references/ROADMAP.txt` - staged automation direction
- `references/prompts/` - reusable install, resume, closeout, and research prompts

## Closeout

Before finishing Cortex-related work, report:

- target project root
- Cortex files changed
- validation status
- whether placeholders remain
- what was not verified
- follow-up tasks
