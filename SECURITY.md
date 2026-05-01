# Security

Codex Cortex is documentation-first and should remain easy to audit.

Please report concerns involving:

- unexpected network behavior
- credential collection or leakage
- broad filesystem reads or writes
- hidden execution paths
- compile, upload, deploy, publish, or destructive behavior in helper scripts
- private chain-of-thought being written to project files

The intended helper scripts are local PowerShell utilities. They should stay narrow, readable, and explicit.
