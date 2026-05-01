# Check Codex Cortex Updates

Use this prompt when checking whether Codex Cortex itself has updates.

1. Run `tools/Check-CodexCortexUpdates.ps1` or the skill-local `scripts/Check-CodexCortexUpdates.ps1`.
2. Summarize the remote version, remote commit, update status, and documented changelog section.
3. Do not download anything yet.
4. Ask for explicit approval before running the update download script.
5. If the user approves download, run `Update-CodexCortexFromGitHub.ps1 -ApproveDownload`.
6. Ask again before installing the downloaded skill or tools.
7. Offer a recurring update check automation with a default 30-day interval.

If waiting for approval, make the request the final text posted:

```text
Waiting for your response:
[single clear update download, install, or automation decision]
```
