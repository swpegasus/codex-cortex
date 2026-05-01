param(
    [string]$CodexHome,

    [switch]$Force
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($CodexHome)) {
    if (-not [string]::IsNullOrWhiteSpace($env:CODEX_HOME)) {
        $CodexHome = $env:CODEX_HOME
    } else {
        $CodexHome = Join-Path $HOME ".codex"
    }
}

$pluginRoot = Split-Path -Parent $PSScriptRoot
$sourceSkill = Join-Path $pluginRoot "skills\codex-cortex-manager"
$skillsRoot = Join-Path $CodexHome "skills"
$targetSkill = Join-Path $skillsRoot "codex-cortex-manager"

if (-not (Test-Path -LiteralPath $sourceSkill -PathType Container)) {
    throw "Source skill not found: $sourceSkill"
}

New-Item -ItemType Directory -Force -Path $skillsRoot | Out-Null

if (Test-Path -LiteralPath $targetSkill) {
    if (-not $Force) {
        throw "Target skill already exists: $targetSkill. Re-run with -Force to replace it."
    }

    $resolvedTarget = (Resolve-Path -LiteralPath $targetSkill).Path
    $resolvedSkillsRoot = (Resolve-Path -LiteralPath $skillsRoot).Path
    if (-not $resolvedTarget.StartsWith($resolvedSkillsRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing to remove target outside Codex skills folder: $resolvedTarget"
    }

    Remove-Item -LiteralPath $resolvedTarget -Recurse -Force
}

Copy-Item -LiteralPath $sourceSkill -Destination $targetSkill -Recurse -Force

Write-Output "Installed Codex Cortex Manager skill to $targetSkill"
Write-Output "Future Codex agents can use codex-cortex-manager to install, validate, and maintain Cortex state across projects."
