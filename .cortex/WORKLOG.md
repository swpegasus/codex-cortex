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
- Publish first GitHub repo as private - reason: project still has temporary no-license notice, so private is safer until license is chosen; evidence: `https://github.com/swpegasus/codex-cortex`; date: 2026-05-01
- Select MIT License - reason: Codex Cortex is a reusable template/tooling project intended for broad adoption with low friction; evidence: `LICENSE.txt`; date: 2026-05-01
- Add publish/base - reason: public GitHub repo needs a blank, project-free base separate from root `.cortex` maintenance state; evidence: `publish/base/manifest.json`; date: 2026-05-01
- Add schemas, prompts, and GitHub templates - reason: agents and workflow systems need stable contracts, reusable prompt patterns, and contribution paths; evidence: `schemas/`, `prompts/`, `.github/`; date: 2026-05-01
- Name first release `alpha` - reason: user requested alpha labeling for the current public base; evidence: GitHub tag/release `alpha`; date: 2026-05-01
- Require final-position blocking questions - reason: user wants paused runs to be obvious and not buried in long output; evidence: `AGENTS.md`, `template/AGENTS.md`, `prompts/`, and `docs/INTEGRATIONS.txt`; date: 2026-05-01
- Add cross-project Codex plugin skill - reason: the distributable skill must work across all projects rather than being locked to this repository; evidence: `plugins/codex-cortex/skills/codex-cortex-manager/SKILL.md`; date: 2026-05-01
- Refresh plugin skill during builds - reason: packaged skill assets should track the current repository template, docs, prompts, and validator; evidence: `tools/Build-CodexCortexPlugin.ps1` and `tools/Build-PublishBase.ps1`; date: 2026-05-01

## Evidence

- PowerShell script parse passed for `tools\Validate-Cortex.ps1` and `tools\Install-Cortex.ps1`; date: 2026-05-01
- JSON parse passed for `template\.cortex\meta.json` and `template\.cortex\mcp-tools.json`; date: 2026-05-01
- Template validation found zero missing files and expected placeholder hits; date: 2026-05-01
- Global skill validation returned `Skill is valid!`; date: 2026-05-01
- GitHub CLI authenticated as `swpegasus` and pushed `main` to `swpegasus/codex-cortex`; date: 2026-05-01
- MIT License added before switching the repository public; date: 2026-05-01
- Root Cortex validation found zero missing files, zero placeholders, zero invalid JSON files, and zero recovery-order missing files; date: 2026-05-01
- Template and publish-base template validation found zero missing files, expected placeholders, zero invalid JSON files, and zero recovery-order missing files; date: 2026-05-01
- Global `codex-cortex` skill was synced with new scripts/references/prompts and validated; date: 2026-05-01
- GitHub release/tag `alpha` created from the current main branch; date: 2026-05-01
- Blocking-question format added to agent rules, prompt pack, human docs, and Cortex state files; date: 2026-05-01
- `codex-cortex-manager` skill validates in both the plugin package and `C:\Users\me\.codex\skills`; date: 2026-05-01
- PowerShell parse passed for the plugin build script, plugin skill installer, and project installer; date: 2026-05-01
- Temporary install smoke test from packaged `codex-cortex-manager` skill had zero missing files, zero invalid JSON files, and zero recovery-order missing files; date: 2026-05-01
- Legacy installed `codex-cortex` skill was converted into a compatibility alias pointing to `codex-cortex-manager`; date: 2026-05-01

## Open Questions

- Should the validator remain pure PowerShell JSON parsing or add full JSON Schema validation through an external dependency?

## Next Step

- Continue with MCP server implementation planning when ready.
