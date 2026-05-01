param(
    [switch]$InstallSystemSkill,
    [switch]$ForceInstall
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$pluginRoot = Join-Path $repoRoot "plugins\codex-cortex"
$skillRoot = Join-Path $pluginRoot "skills\codex-cortex-manager"

if (-not (Test-Path -LiteralPath $skillRoot -PathType Container)) {
    throw "Skill folder not found: $skillRoot"
}

function Remove-ChildPath {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $true)]
        [string]$AllowedRoot
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        return
    }

    $resolvedPath = (Resolve-Path -LiteralPath $Path).Path
    $resolvedAllowedRoot = (Resolve-Path -LiteralPath $AllowedRoot).Path

    if (-not $resolvedPath.StartsWith($resolvedAllowedRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing to remove path outside allowed root: $resolvedPath"
    }

    Remove-Item -LiteralPath $resolvedPath -Recurse -Force
}

$assetsRoot = Join-Path $skillRoot "assets"
$templateTarget = Join-Path $assetsRoot "template"
New-Item -ItemType Directory -Force -Path $assetsRoot | Out-Null
Remove-ChildPath -Path $templateTarget -AllowedRoot $assetsRoot
Copy-Item -LiteralPath (Join-Path $repoRoot "template") -Destination $templateTarget -Recurse -Force

$referencesRoot = Join-Path $skillRoot "references"
$promptsTarget = Join-Path $referencesRoot "prompts"
New-Item -ItemType Directory -Force -Path $referencesRoot | Out-Null
Remove-ChildPath -Path $promptsTarget -AllowedRoot $referencesRoot
New-Item -ItemType Directory -Force -Path $promptsTarget | Out-Null

foreach ($docFile in Get-ChildItem -LiteralPath (Join-Path $repoRoot "docs") -Filter "*.txt" -File) {
    Copy-Item -LiteralPath $docFile.FullName -Destination (Join-Path $referencesRoot $docFile.Name) -Force
}

Copy-Item -Path (Join-Path $repoRoot "prompts\*.md") -Destination $promptsTarget -Force

$scriptsRoot = Join-Path $skillRoot "scripts"
New-Item -ItemType Directory -Force -Path $scriptsRoot | Out-Null
Copy-Item -LiteralPath (Join-Path $repoRoot "tools\Validate-Cortex.ps1") -Destination (Join-Path $scriptsRoot "Validate-CortexProject.ps1") -Force

$pluginManifestPath = Join-Path $pluginRoot ".codex-plugin\plugin.json"
Get-Content -LiteralPath $pluginManifestPath -Raw | ConvertFrom-Json | Out-Null

Write-Output "Codex Cortex plugin skill package refreshed from repository source."

if ($InstallSystemSkill) {
    $installScript = Join-Path $pluginRoot "scripts\Install-CodexCortexManagerSkill.ps1"
    if ($ForceInstall) {
        & $installScript -Force
    } else {
        & $installScript
    }
}
