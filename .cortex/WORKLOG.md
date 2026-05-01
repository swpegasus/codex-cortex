# Work Log

Last updated: 2026-05-01

This is public project state. It records decisions, assumptions, evidence, open questions, and next steps. It is not private chain-of-thought.

## Current Focus

- Prepare Codex Cortex for future use by agents, prompts, threads, MCP tools, n8n workflows, and human maintainers.

## Decisions

- Rename project to Codex Cortex - reason: the package is no longer only a starter template; it is a reusable continuity system; evidence: repository structure under `codex-cortex`; date: 2026-05-01
- Use `.cortex/` as installed state root - reason: shorter, project-local, and more accurate than `_codex/`; evidence: `template/.cortex/`; date: 2026-05-01
- Rename `STREAM_OF_THOUGHT.md` to `WORKLOG.md` - reason: avoids chain-of-thought confusion and describes public decision/evidence logging; evidence: `template/.cortex/WORKLOG.md`; date: 2026-05-01
- Add `LEARNINGS.md` - reason: future agents, prompts, and threads need a durable place for failures, caveats, and do-not-repeat lessons; evidence: `template/.cortex/LEARNINGS.md`; date: 2026-05-01
- Install a global `codex-cortex` skill - reason: future Codex agents need system-level instructions for installing and maintaining Cortex state; evidence: `C:\Users\me\.codex\skills\codex-cortex`; date: 2026-05-01

## Evidence

- PowerShell script parse passed for `tools\Validate-Cortex.ps1` and `tools\Install-Cortex.ps1`; date: 2026-05-01
- JSON parse passed for `template\.cortex\meta.json` and `template\.cortex\mcp-tools.json`; date: 2026-05-01
- Template validation found zero missing files and expected placeholder hits; date: 2026-05-01
- Global skill validation returned `Skill is valid!`; date: 2026-05-01

## Open Questions

- Which GitHub destination should host the project?
- Should the repository be public immediately or start private?
- Which license should replace `LICENSE.txt` before public release?

## Next Step

- Resolve GitHub access, add a remote, push `main`, and optionally create a release/tag.
