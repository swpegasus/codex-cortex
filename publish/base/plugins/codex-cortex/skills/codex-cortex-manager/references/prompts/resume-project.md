# Resume A Cortex Project

Use this prompt when starting work in a project that already has Cortex installed.

1. Read `START_HERE.md`.
2. Read `AGENTS.md`.
3. Read `.cortex/README.md`.
4. Read `.cortex/STATE.md`.
5. Read `.cortex/LEARNINGS.md`.
6. Read `.cortex/TASKS.md`.
7. Inspect source files before editing.
8. Follow project gates.

The target project is the primary source of truth. Other projects may be used as optional references only. Apply trivial compatible reuse without asking, but ask before adapting non-trivial architecture, dependencies, behavior, workflow, deployment, or project direction from another project.

If a failed approach, shell caveat, quoting requirement, compatibility issue, or setup requirement is discovered, update `.cortex/LEARNINGS.md` during the work.

If the run must stop for user input, make the question the final text posted:

```text
Waiting for your response:
[single clear question or requested decision]
```
