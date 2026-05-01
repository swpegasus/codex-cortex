# State

Last updated: 2026-05-01

## Project Phase

Published public repository.

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
- Missing: GitHub release/tag.
- Verified: PowerShell scripts parse, metadata JSON parses, template validator reports no missing required files, global skill validates, GitHub CLI 2.92.0 is installed/authenticated, MIT License was selected, and `main` was pushed to the GitHub repo.
- Not verified: GitHub release flow, MCP server implementation, n8n workflow integration.

## Active Source Folders

- `D:\Codex Projects\_codex\codex-cortex`
- `C:\Users\me\.codex\skills\codex-cortex`

## Current Recommendation

Keep Codex Cortex documentation-first and auditable. Build future automation in stages: validator first, then read-only MCP tools, then narrow write tools, then workflow orchestration.

## Open Questions

- Should a first release/tag be created now or after more MCP/server work?

## Next Step

Optionally create a first release/tag when ready.
