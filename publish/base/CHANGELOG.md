# Changelog

## alpha - 2026-05-01

- First public alpha release.
- Includes Codex Cortex blank template, publish base, validation and install tools, schemas, prompt pack, integration docs, GitHub community files, and MIT License.
- Adds Codex plugin packaging with the cross-project `codex-cortex-manager` skill.
- Adds approval-gated GitHub update checks and documented update automation guidance.
- Adds project-aware plugin rules for target-project-first context and approval before non-trivial cross-project reuse.
- Known gaps: no MCP server runtime, no n8n workflow examples, and no full JSON Schema validation beyond JSON parsing.

## 0.2.0 - 2026-05-01

- Renamed the project to Codex Cortex.
- Reworked the installed state folder from `_codex/` to `.cortex/`.
- Shortened installed file names.
- Added GitHub-style README.
- Added plain text functional and safety documentation.
- Added plain text structure and naming documentation.
- Added read-only validation helper.
- Added optional install helper.
- Added compact metadata and MCP tool contract templates.
- Added autonomous learning capture for agents, prompts, and threads.
- Added temporary license notice pending final license selection.

## 0.2.1 - 2026-05-01

- Replaced the temporary license notice with the MIT License.
- Prepared repository for public visibility.

## 0.3.0 - 2026-05-01

- Added prompt pack for installation, resume, closeout, and research workflows.
- Added JSON Schemas for Cortex metadata and MCP tool contracts.
- Added integration documentation and research notes.
- Added GitHub issue and pull request templates.
- Added Code of Conduct.
- Added publish-base generation script.
- Added generated `publish/base/` package folder.
- Strengthened validation with JSON and recovery-order checks.
