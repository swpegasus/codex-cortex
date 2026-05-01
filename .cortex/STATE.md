# State

Last updated: 2026-05-01

## Project Phase

Pre-publish setup.

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
- Missing: GitHub remote and public/private GitHub publication.
- Verified: PowerShell scripts parse, metadata JSON parses, template validator reports no missing required files, and global skill validates.
- Not verified: GitHub push, GitHub release flow, MCP server implementation, n8n workflow integration.

## Active Source Folders

- `D:\Codex Projects\_codex\codex-cortex`
- `C:\Users\me\.codex\skills\codex-cortex`

## Current Recommendation

Keep Codex Cortex documentation-first and auditable. Build future automation in stages: validator first, then read-only MCP tools, then narrow write tools, then workflow orchestration.

## Open Questions

- Which GitHub organization or account should host the repo?
- Should the first GitHub repository be public or private?
- Which license should be selected before public release?

## Next Step

Install or authorize GitHub publishing access, then add the remote and push `main`.
