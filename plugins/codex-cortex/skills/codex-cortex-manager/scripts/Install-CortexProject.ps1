param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectRoot,

    [switch]$Force
)

$ErrorActionPreference = "Stop"

$skillRoot = Split-Path -Parent $PSScriptRoot
$templateRoot = Join-Path $skillRoot "assets\template"
$targetRoot = (Resolve-Path -LiteralPath $ProjectRoot).Path

if (-not (Test-Path -LiteralPath $templateRoot -PathType Container)) {
    throw "Template folder not found: $templateRoot"
}

$templateFiles = Get-ChildItem -LiteralPath $templateRoot -Recurse -File -Force

foreach ($file in $templateFiles) {
    $relative = $file.FullName.Substring($templateRoot.Length).TrimStart("\", "/")
    $target = Join-Path $targetRoot $relative
    $targetDir = Split-Path -Parent $target

    if (-not (Test-Path -LiteralPath $targetDir -PathType Container)) {
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    }

    if ((Test-Path -LiteralPath $target -PathType Leaf) -and -not $Force) {
        Write-Output "Skipped existing file: $relative"
        continue
    }

    Copy-Item -LiteralPath $file.FullName -Destination $target -Force:$Force
    Write-Output "Copied: $relative"
}

Write-Output "Codex Cortex project install complete."
