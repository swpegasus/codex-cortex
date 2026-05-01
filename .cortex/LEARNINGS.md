# Learnings

Last updated: 2026-05-01

This file records public lessons future runs should not have to rediscover. Agents, reusable prompts, and normal threads should update this file during work when durable lessons are found.

Do not store private chain-of-thought. Record the useful conclusion, evidence, and better next action.

## Do Not Repeat

- Do not assume GitHub plugin access means repository publishing is available - reason: the connector can be authenticated but still have no installed accounts or repositories; better path: check installed accounts/installations before promising publish; found: 2026-05-01
- Do not treat the template validator's placeholder findings as a failure when validating the reusable template itself - reason: placeholders are expected before installation into a real project; better path: check `missingFiles` first and interpret placeholder hits by context; found: 2026-05-01

## Command / Shell / Path Caveats

- Git commits require repository-local identity if global git identity is missing - requirement: set `git config user.name` and `git config user.email`; symptom if missed: commit fails with `Author identity unknown`; found: 2026-05-01
- GitHub CLI was installed through `winget` - requirement: refresh PATH or open a new shell after install; symptom if missed: current shell may still not find `gh`; evidence: `C:\Program Files\GitHub CLI\gh.exe`; found: 2026-05-01
- GitHub CLI still requires authentication after install - requirement: run `gh auth login`; symptom if missed: `You are not logged into any GitHub hosts`; found: 2026-05-01
- PowerShell paths with spaces should be quoted and usually passed with `-LiteralPath` - requirement: quote paths like `D:\Codex Projects\_codex\codex-cortex`; symptom if missed: path parsing mistakes; found: 2026-05-01

## Required To Make Things Work

- System-wide Codex Cortex use requires a skill under `C:\Users\me\.codex\skills\codex-cortex` - context: future agents can discover the skill from the Codex skills folder; evidence: skill validation passed; found: 2026-05-01
- Project-local Cortex use requires root `AGENTS.md`, `START_HERE.md`, and `.cortex/` - context: future runs need deterministic recovery order; evidence: installed into the Codex Cortex repo; found: 2026-05-01

## Failed Approaches

- Publishing directly through the GitHub connector failed - result: connector reported no installed repositories/accounts/installations; cause: GitHub app has no accessible installation in this session; next time: authorize/install the GitHub app or authenticate `gh`; found: 2026-05-01

## Debugging Notes

- GitHub publish readiness - likely cause: unauthenticated `gh` and empty connector installation list; useful check: run `gh --version`, `gh auth status`, and GitHub connector installation/list repository calls; found: 2026-05-01

## Compatibility Notes

- Windows PowerShell is the active shell - impact: helper scripts are PowerShell-first and validation examples use PowerShell syntax; found: 2026-05-01

## Open Learning Questions

- Which GitHub auth path is preferred for this system - why it matters: determines whether publishing should use `gh`, GitHub connector tools, or manual remote setup; next check: run `gh auth login` or verify installed GitHub app access.
