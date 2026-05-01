param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectRoot
)

$ErrorActionPreference = "Stop"

$root = (Resolve-Path -LiteralPath $ProjectRoot).Path

$requiredFiles = @(
    "AGENTS.md",
    "START_HERE.md",
    ".cortex/README.md",
    ".cortex/STATE.md",
    ".cortex/RECOVERY.md",
    ".cortex/WORKLOG.md",
    ".cortex/LEARNINGS.md",
    ".cortex/SESSIONS.md",
    ".cortex/TASKS.md",
    ".cortex/GUIDE.md",
    ".cortex/RULES.md",
    ".cortex/meta.json",
    ".cortex/mcp-tools.json"
)

$result = [ordered]@{
    projectRoot = $root
    missingFiles = @()
    placeholderHits = @()
    safetyGateHits = @()
    checkedAt = (Get-Date).ToString("s")
}

foreach ($relativePath in $requiredFiles) {
    $fullPath = Join-Path $root $relativePath
    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
        $result.missingFiles += $relativePath
    }
}

$scanRoots = @(
    (Join-Path $root ".cortex"),
    (Join-Path $root "AGENTS.md"),
    (Join-Path $root "START_HERE.md")
)

$scanFiles = @()
foreach ($scanRoot in $scanRoots) {
    if (Test-Path -LiteralPath $scanRoot -PathType Container) {
        $scanFiles += Get-ChildItem -LiteralPath $scanRoot -Recurse -File -Include "*.md", "*.json"
    } elseif (Test-Path -LiteralPath $scanRoot -PathType Leaf) {
        $scanFiles += Get-Item -LiteralPath $scanRoot
    }
}

foreach ($file in $scanFiles) {
    $relative = $file.FullName.Substring($root.Length).TrimStart("\", "/")
    $matches = Select-String -LiteralPath $file.FullName -Pattern "<[A-Za-z0-9_ /|.-]+>" -AllMatches

    foreach ($match in $matches) {
        $result.placeholderHits += [ordered]@{
            file = $relative
            line = $match.LineNumber
            text = $match.Line.Trim()
        }
    }
}

$agentsPath = Join-Path $root "AGENTS.md"
if (Test-Path -LiteralPath $agentsPath -PathType Leaf) {
    $agentsText = Get-Content -LiteralPath $agentsPath -Raw

    foreach ($term in @("compile", "upload", "deploy", "publish", "go")) {
        if ($agentsText -match [regex]::Escape($term)) {
            $result.safetyGateHits += $term
        }
    }
}

$result | ConvertTo-Json -Depth 5
