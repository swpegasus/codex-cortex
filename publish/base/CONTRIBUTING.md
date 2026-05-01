# Contributing

Contributions should preserve the project's safety model:

- Keep documentation human-readable.
- Keep scripts short and auditable.
- Do not add network access unless clearly documented and justified.
- Do not add compile, upload, deploy, publish, or destructive behavior to helper scripts.
- Preserve project-local scope.
- Preserve the private chain-of-thought boundary.

Before proposing changes, run:

```powershell
.\tools\Validate-Cortex.ps1 -ProjectRoot .\template
```

The template intentionally contains placeholders, so placeholder findings are expected in template mode.
