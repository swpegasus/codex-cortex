# Tasks

Last updated: 2026-05-01

Use this list for deferred work, reminders, cleanup, validation, and future approved tasks.

## Active

## Blocked

## Later

- [ ] Build MCP server - revisit when: read-only validator and metadata contract are stable; added: 2026-05-01
- [ ] Build n8n workflow examples - revisit when: MCP tool shape is implemented or selected; added: 2026-05-01
- [ ] Add filled-in example project - revisit when: core template structure is stable; added: 2026-05-01
- [ ] Add schema validation beyond JSON parsing - revisit when: choosing a bundled JSON Schema validator or runtime dependency is acceptable; added: 2026-05-01
- [ ] Add archive/release package generation - revisit when: first release/tag is ready; added: 2026-05-01

## Done

- [x] Add GitHub update-check flow - completed: 2026-05-01; notes: added check-only metadata script, approval-gated update script, update docs, prompt, and MCP tool contract entries
- [x] Add update automation guidance - completed: 2026-05-01; notes: agents should offer a 30-day default recurring update check but must ask permission before creating it
- [x] Add cross-project Codex plugin skill - completed: 2026-05-01; notes: created `plugins/codex-cortex` with `codex-cortex-manager` skill, plugin manifest, marketplace entry, and system skill installer
- [x] Add plugin build refresh - completed: 2026-05-01; notes: `Build-CodexCortexPlugin.ps1` refreshes the packaged skill from repository source and `Build-PublishBase.ps1` calls it
- [x] Install cross-project system skill - completed: 2026-05-01; notes: installed `C:\Users\me\.codex\skills\codex-cortex-manager` and validated it
- [x] Add blocking-question guidance - completed: 2026-05-01; notes: agents, prompts, and integration docs now require waiting questions to be the final distinct response block
- [x] Create GitHub-ready Codex Cortex repo structure - completed: 2026-05-01; notes: added README, docs, template, tools, metadata, and safety files
- [x] Install global Codex Cortex skill - completed: 2026-05-01; notes: created `C:\Users\me\.codex\skills\codex-cortex` and validated it
- [x] Install Cortex into the Codex Cortex repo - completed: 2026-05-01; notes: added root `AGENTS.md`, `START_HERE.md`, and `.cortex/`
- [x] Commit root Cortex install - completed: 2026-05-01; notes: root Cortex files prepared for local commit
- [x] Install GitHub CLI system-wide - completed: 2026-05-01; notes: installed `gh` 2.92.0 with `winget`; PATH refresh or new shell may be needed
- [x] Authenticate GitHub CLI - completed: 2026-05-01; notes: authenticated as `swpegasus`
- [x] Publish to GitHub - completed: 2026-05-01; notes: created private repo `swpegasus/codex-cortex` and pushed `main`
- [x] Choose a real license - completed: 2026-05-01; notes: selected MIT License for broad reuse of templates and tooling
- [x] Make repository public - completed: 2026-05-01; notes: switched `swpegasus/codex-cortex` from private to public
- [x] Add separate publish base folder - completed: 2026-05-01; notes: generated `publish/base/` as project-free distribution base
- [x] Add machine-readable Cortex schema - completed: 2026-05-01; notes: added `schemas/cortex.schema.json` and `schemas/mcp-tools.schema.json`
- [x] Add agent prompt pack - completed: 2026-05-01; notes: added install, resume, closeout, and research prompts under `prompts/`
- [x] Add GitHub issue templates - completed: 2026-05-01; notes: added bug, feature, integration issue templates and PR template under `.github/`
- [x] Add packaging script - completed: 2026-05-01; notes: added `tools/Build-PublishBase.ps1`
- [x] Add integration documentation for MCP and n8n - completed: 2026-05-01; notes: added `docs/INTEGRATIONS.txt` and `docs/RESEARCH_NOTES.txt`
- [x] Sync installed system skill - completed: 2026-05-01; notes: copied updated scripts/references/prompts into `C:\Users\me\.codex\skills\codex-cortex` and validated the skill
- [x] Create GitHub release/tag - completed: 2026-05-01; notes: release/tag name is `alpha`

## Rule

When a task is handled, move it to `Done` with the completion date. If `Done` gets too large, archive older completed items into `archive/YYYY-MM-done.md`.
