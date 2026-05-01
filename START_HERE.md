# Start Here

Last updated: 2026-05-01

Read these files first:

1. `START_HERE.md`
2. `AGENTS.md`
3. `.cortex/README.md`
4. `.cortex/STATE.md`
5. `.cortex/WORKLOG.md`
6. `.cortex/LEARNINGS.md`
7. `.cortex/SESSIONS.md`
8. `.cortex/TASKS.md`
9. `.cortex/RECOVERY.md`
10. `.cortex/GUIDE.md`
11. `.cortex/RULES.md`

## Current State

- Codex Cortex has been redesigned into a GitHub-ready local repository.
- The cross-project Codex skill `codex-cortex-manager` has been installed under `C:\Users\me\.codex\skills\codex-cortex-manager`.
- Cortex has been installed into this repository under `.cortex/`.
- The repository is public at `https://github.com/swpegasus/codex-cortex`.
- A project-free distribution base is generated under `publish/base/`.
- A Codex plugin package exists under `plugins/codex-cortex/`.

## Current Working Rule

Do not compile, deploy, publish, or run risky automation without explicit user approval. For GitHub publishing, use authenticated GitHub CLI or an authorized connector.

If work must stop for a user answer, make the question the final text posted and separate it with:

```text
Waiting for your response:
[single clear question or requested decision]
```

## Project-Scoped Continuity

Use only this project's Cortex files unless the user explicitly redirects to another project.

## Next Step

Continue with MCP server planning, n8n workflow examples, or release refresh after the plugin update is pushed.
