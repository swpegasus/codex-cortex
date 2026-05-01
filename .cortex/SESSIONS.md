# Sessions

## 2026-05-01 - Codex Cortex setup and system install

- Changed: redesigned the template as `codex-cortex`, added GitHub-ready docs, installed Cortex into the repo itself, and created a global Codex skill.
- Verified: PowerShell scripts parse, JSON metadata parses, template validation reports no missing files, skill validation passes, GitHub CLI 2.92.0 is installed/authenticated, and `main` was pushed to GitHub.
- Not done: license selection, public release decision, GitHub release/tag, MCP server implementation, n8n workflow integration.
- Status: private GitHub repo exists at `https://github.com/swpegasus/codex-cortex`.
- Follow-up: choose license, decide whether to make repo public, create release/tag when ready.

## 2026-05-01 - Public release setup

- Changed: replaced temporary license notice with MIT License and prepared repository for public visibility.
- Verified: Cortex validation still passes with no missing files or placeholders.
- Not done: no GitHub release/tag created yet.
- Status: repository is intended to be public after this update is pushed and visibility is changed.
- Follow-up: consider creating a first tag/release.

## 2026-05-01 - Integration and publish-base pass

- Changed: added schemas, prompts, integration docs, research notes, GitHub community templates, publish-base builder, and generated `publish/base/`.
- Verified: PowerShell scripts parse; root, template, and publish-base validation have no missing files; JSON parses; global skill validates after sync.
- Not done: MCP server runtime, n8n workflow examples, release/tag.
- Status: repository is cleaner for public users because root `.cortex/` state is separate from generated `publish/base/`.
- Follow-up: decide whether to tag a release or continue into MCP server implementation.

## 2026-05-01 - Alpha release

- Changed: added `alpha` changelog entry and prepared release state.
- Verified: Cortex validation still passes before release.
- Not done: MCP server runtime and n8n examples.
- Status: GitHub release/tag is named `alpha`.
- Follow-up: continue with MCP server planning or n8n workflow examples.

## 2026-05-01 - Blocking question guidance

- Changed: added a rule that any question blocking progress must be the final visible response block.
- Verified: pending full validation after publish-base regeneration.
- Not done: no release tag movement planned for this documentation-only follow-up.
- Status: rule is being propagated through repo docs, templates, prompts, publish base, and installed skill.
- Follow-up: validate and push the update to GitHub.

## 2026-05-01 - Codex plugin and manager skill

- Changed: added `plugins/codex-cortex/` with a cross-project `codex-cortex-manager` skill, plugin manifest, marketplace entry, plugin build script, and system skill installer.
- Verified: packaged skill validates, installed system skill validates, legacy alias skill validates, plugin-related PowerShell scripts parse, plugin JSON parses, and a temporary project smoke install has zero missing files.
- Not done: no MCP server runtime yet.
- Status: plugin package is refreshed from repository source during builds.
- Follow-up: regenerate publish base, run full validation, commit, and push.
