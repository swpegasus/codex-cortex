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
- `plugins/codex-cortex/`
- `publish/base/`
- `AGENTS.md`
- `START_HERE.md`
- `.cortex/`

## Implementation State

- Exists: GitHub-ready Codex Cortex repository structure, blank template, publish base, docs, prompt pack, schemas, installer, validator, plugin builder, update checker, approval-gated updater, publish-base builder, metadata, MCP tool contract draft, GitHub community files, Codex plugin package, and cross-project `codex-cortex-manager` system skill.
- Missing: actual MCP server implementation, concrete n8n workflows.
- Verified: PowerShell scripts parse, metadata JSON parses, template validator reports no missing required files, publish base validator reports no missing required files, plugin JSON parses, global `codex-cortex-manager` skill validates, update check returns metadata without requiring download, updater stops at `approval_required` without approval switches, a temporary project smoke install has zero missing files and zero invalid JSON files, GitHub CLI 2.92.0 is installed/authenticated, MIT License was selected, `main` was pushed to the GitHub repo, and the GitHub release/tag is named `alpha`.
- Not verified: MCP server runtime behavior, n8n workflow execution.

## Active Source Folders

- `D:\Codex Projects\_codex\codex-cortex`
- `C:\Users\me\.codex\skills\codex-cortex-manager`

## Current Recommendation

Keep Codex Cortex documentation-first and auditable. Build future automation in stages: validator first, then read-only MCP tools, then narrow write tools, then workflow orchestration.

## Open Questions

- Should schema validation remain dependency-free or use a JSON Schema validator?

## Next Step

Validate the plugin/publish update, then push it to GitHub.
