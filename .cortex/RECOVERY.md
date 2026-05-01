# Recovery

Use this file when resuming after a crash, lost context, tool update, or long pause.

## Read Order

1. `../START_HERE.md`
2. `../AGENTS.md`
3. `README.md`
4. `STATE.md`
5. `WORKLOG.md`
6. `LEARNINGS.md`
7. `SESSIONS.md`
8. `TASKS.md`
9. `GUIDE.md`
10. `RULES.md`

## Safe Resume

1. Confirm the current user scope.
2. Read current state before editing.
3. Inspect source files before assuming architecture.
4. Check `LEARNINGS.md` for failed approaches and caveats.
5. Verify drift-prone facts before acting.
6. Follow build, upload, deploy, publish, and risky automation gates.
7. Update `LEARNINGS.md` during work when new failures, caveats, quoting requirements, compatibility notes, or do-not-repeat lessons are discovered.

## Safe Pause State

- Local repo exists at `D:\Codex Projects\_codex\codex-cortex`.
- Local git repo is initialized on `main`.
- Initial project commit exists.
- Cortex root state files are installed but should be committed after validation.
- GitHub publication is blocked by missing GitHub CLI and missing GitHub app installations in this session.

## Build / Test / Deploy Rules

- Validation helper: `.\tools\Validate-Cortex.ps1 -ProjectRoot .\template`
- Skill validation: `python C:\Users\me\.codex\skills\.system\skill-creator\scripts\quick_validate.py C:\Users\me\.codex\skills\codex-cortex`
- Publishing requires a valid GitHub remote and credentials/tool access.
- Do not publish through unverified credentials or unrelated repositories.

## Guardrails

- Keep helper scripts local, short, and auditable.
- Do not add network behavior to helper scripts without documenting it in `docs/SAFETY.txt`.
- Keep template files generic and placeholder-based.
- Keep root `.cortex/` files project-specific to Codex Cortex itself.
