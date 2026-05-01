# State

Last updated: 2026-05-01

## Project Phase

Alpha release.

## Source Material

- `README.md`
- `docs/`
- `tools/`
- `template/`
- `prompts/`
- `schemas/`
- `publish/base/`
- `AGENTS.md`
- `START_HERE.md`
- `.cortex/`

## Implementation State

- Exists: GitHub-ready Codex Cortex repository structure, blank template, publish base, docs, prompt pack, schemas, installer, validator, publish-base builder, metadata, MCP tool contract draft, GitHub community files, and global Codex skill.
- Missing: actual MCP server implementation, concrete n8n workflows.
- Verified: PowerShell scripts parse, metadata JSON parses, template validator reports no missing required files, publish base validator reports no missing required files, global skill validates, GitHub CLI 2.92.0 is installed/authenticated, MIT License was selected, `main` was pushed to the GitHub repo, and the GitHub release/tag is named `alpha`.
- Not verified: MCP server runtime behavior, n8n workflow execution.

## Active Source Folders

- `D:\Codex Projects\_codex\codex-cortex`
- `C:\Users\me\.codex\skills\codex-cortex`

## Current Recommendation

Keep Codex Cortex documentation-first and auditable. Build future automation in stages: validator first, then read-only MCP tools, then narrow write tools, then workflow orchestration.

## Open Questions

- Should schema validation remain dependency-free or use a JSON Schema validator?

## Next Step

Continue with MCP server planning or n8n workflow examples.
