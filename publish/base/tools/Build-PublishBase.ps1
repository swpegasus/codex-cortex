param(
    [string]$OutputPath = "publish/base",
    [switch]$Clean
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$outputRoot = Join-Path $repoRoot $OutputPath

if ($Clean -and (Test-Path -LiteralPath $outputRoot)) {
    $resolvedOutput = (Resolve-Path -LiteralPath $outputRoot).Path
    if (-not $resolvedOutput.StartsWith($repoRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing to clean output outside repository: $resolvedOutput"
    }
    Remove-Item -LiteralPath $outputRoot -Recurse -Force
}

New-Item -ItemType Directory -Force -Path $outputRoot | Out-Null

$copyRoots = @(
    ".github",
    "docs",
    "prompts",
    "schemas",
    "template",
    "tools"
)

$copyFiles = @(
    "README.md",
    "LICENSE.txt",
    "CHANGELOG.md",
    "CONTRIBUTING.md",
    "SECURITY.md",
    "CODE_OF_CONDUCT.md"
)

foreach ($relative in $copyRoots) {
    $source = Join-Path $repoRoot $relative
    $target = Join-Path $outputRoot $relative
    if (Test-Path -LiteralPath $source -PathType Container) {
        Copy-Item -LiteralPath $source -Destination $target -Recurse -Force
    }
}

foreach ($relative in $copyFiles) {
    $source = Join-Path $repoRoot $relative
    $target = Join-Path $outputRoot $relative
    if (Test-Path -LiteralPath $source -PathType Leaf) {
        Copy-Item -LiteralPath $source -Destination $target -Force
    }
}

$manifest = [ordered]@{
    name = "Codex Cortex Base"
    generatedAt = (Get-Date).ToString("s")
    sourceRoot = $repoRoot
    outputRoot = $outputRoot
    includes = @($copyRoots + $copyFiles)
    excludes = @(".git", ".cortex", "publish")
}

$manifestPath = Join-Path $outputRoot "manifest.json"
$manifest | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath $manifestPath -Encoding UTF8

Write-Output "Publish base generated at $outputRoot"
