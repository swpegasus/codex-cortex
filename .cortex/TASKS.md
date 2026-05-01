# Tasks

Last updated: 2026-05-01

Use this list for deferred work, reminders, cleanup, validation, and future approved tasks.

## Active

- [ ] Publish to GitHub - context: user requested GitHub publication; source: user request; added: 2026-05-01
- [ ] Choose a real license - context: `LICENSE.txt` is currently a temporary no-license notice; source: repository review; added: 2026-05-01
- [ ] Authenticate GitHub CLI - context: `gh` is installed but not logged into any GitHub host; source: `gh auth status`; added: 2026-05-01

## Blocked

- [ ] Push repository to GitHub - blocked by: `gh` is installed but unauthenticated, and GitHub connector has no installed accounts/repositories; added: 2026-05-01

## Later

- [ ] Build MCP server - revisit when: read-only validator and metadata contract are stable; added: 2026-05-01
- [ ] Build n8n workflow examples - revisit when: MCP tool shape is implemented or selected; added: 2026-05-01
- [ ] Add filled-in example project - revisit when: core template structure is stable; added: 2026-05-01

## Done

- [x] Create GitHub-ready Codex Cortex repo structure - completed: 2026-05-01; notes: added README, docs, template, tools, metadata, and safety files
- [x] Install global Codex Cortex skill - completed: 2026-05-01; notes: created `C:\Users\me\.codex\skills\codex-cortex` and validated it
- [x] Install Cortex into the Codex Cortex repo - completed: 2026-05-01; notes: added root `AGENTS.md`, `START_HERE.md`, and `.cortex/`
- [x] Commit root Cortex install - completed: 2026-05-01; notes: root Cortex files prepared for local commit
- [x] Install GitHub CLI system-wide - completed: 2026-05-01; notes: installed `gh` 2.92.0 with `winget`; PATH refresh or new shell may be needed

## Rule

When a task is handled, move it to `Done` with the completion date. If `Done` gets too large, archive older completed items into `archive/YYYY-MM-done.md`.
