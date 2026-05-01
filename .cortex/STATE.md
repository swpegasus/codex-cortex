# State

Last updated: 2026-05-01

## Project Phase

Published private repository.

## Source Material

- `README.md`
- `docs/`
- `tools/`
- `template/`
- `AGENTS.md`
- `START_HERE.md`
- `.cortex/`

## Implementation State

- Exists: GitHub-ready Codex Cortex repository structure, template, docs, installer, validator, metadata, MCP tool contract draft, and global Codex skill.
- Missing: final license selection, public release decision, GitHub release/tag.
- Verified: PowerShell scripts parse, metadata JSON parses, template validator reports no missing required files, global skill validates, GitHub CLI 2.92.0 is installed/authenticated, and `main` was pushed to the private GitHub repo.
- Not verified: GitHub release flow, MCP server implementation, n8n workflow integration.

## Active Source Folders

- `D:\Codex Projects\_codex\codex-cortex`
- `C:\Users\me\.codex\skills\codex-cortex`

## Current Recommendation

Keep Codex Cortex documentation-first and auditable. Build future automation in stages: validator first, then read-only MCP tools, then narrow write tools, then workflow orchestration.

## Open Questions

- Which license should be selected before public release?
- Should the private repository be made public after license selection?

## Next Step

Choose a license, then decide whether to keep the repo private or make it public.
