param(
    [string]$Repository = "swpegasus/codex-cortex",
    [string]$Branch = "main",
    [string]$CodexHome,
    [string]$DownloadRoot,
    [switch]$ApproveDownload,
    [switch]$InstallSystemSkill,
    [switch]$ApproveInstall
)

$ErrorActionPreference = "Stop"

function Get-SafeCodexHome {
    param([string]$RequestedCodexHome)

    if (-not [string]::IsNullOrWhiteSpace($RequestedCodexHome)) {
        return $RequestedCodexHome
    }

    if (-not [string]::IsNullOrWhiteSpace($env:CODEX_HOME)) {
        return $env:CODEX_HOME
    }

    return (Join-Path $HOME ".codex")
}

function Copy-SkillToCodexHome {
    param(
        [Parameter(Mandatory = $true)]
        [string]$SourceSkill,
        [Parameter(Mandatory = $true)]
        [string]$TargetCodexHome
    )

    $skillsRoot = Join-Path $TargetCodexHome "skills"
    $targetSkill = Join-Path $skillsRoot "codex-cortex-manager"

    New-Item -ItemType Directory -Force -Path $skillsRoot | Out-Null

    if (Test-Path -LiteralPath $targetSkill) {
        $resolvedTarget = (Resolve-Path -LiteralPath $targetSkill).Path
        $resolvedSkillsRoot = (Resolve-Path -LiteralPath $skillsRoot).Path
        if (-not $resolvedTarget.StartsWith($resolvedSkillsRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
            throw "Refusing to remove target outside Codex skills folder: $resolvedTarget"
        }

        Remove-Item -LiteralPath $resolvedTarget -Recurse -Force
    }

    Copy-Item -LiteralPath $SourceSkill -Destination $targetSkill -Recurse -Force
    return $targetSkill
}

$checkScript = Join-Path $PSScriptRoot "Check-CodexCortexUpdates.ps1"
if (-not (Test-Path -LiteralPath $checkScript -PathType Leaf)) {
    throw "Update check script not found: $checkScript"
}

$check = (& $checkScript -Repository $Repository -Branch $Branch) | ConvertFrom-Json

if (-not $ApproveDownload) {
    [ordered]@{
        status = "approval_required"
        requiredApproval = "download"
        check = $check
        message = "Review documented changes with the user before downloading. Re-run with -ApproveDownload only after explicit approval."
        suggestedCommand = ".\Update-CodexCortexFromGitHub.ps1 -ApproveDownload"
    } | ConvertTo-Json -Depth 8
    return
}

if ([string]::IsNullOrWhiteSpace($DownloadRoot)) {
    $DownloadRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("codex-cortex-update-" + [guid]::NewGuid().ToString("N"))
}

New-Item -ItemType Directory -Force -Path $DownloadRoot | Out-Null

$zipPath = Join-Path $DownloadRoot "codex-cortex.zip"
$extractRoot = Join-Path $DownloadRoot "extract"
$zipUrl = "https://github.com/$Repository/archive/refs/heads/$Branch.zip"

$request = @{
    Uri = $zipUrl
    OutFile = $zipPath
    Headers = @{
        "User-Agent" = "Codex-Cortex-Update"
    }
}

if ($PSVersionTable.PSVersion.Major -lt 6) {
    $request.UseBasicParsing = $true
}

Invoke-WebRequest @request
Expand-Archive -LiteralPath $zipPath -DestinationPath $extractRoot -Force

$repoFolder = Get-ChildItem -LiteralPath $extractRoot -Directory | Select-Object -First 1
if (-not $repoFolder) {
    throw "Downloaded archive did not contain a repository folder."
}

$sourceSkill = Join-Path $repoFolder.FullName "plugins\codex-cortex\skills\codex-cortex-manager"
if (-not (Test-Path -LiteralPath $sourceSkill -PathType Container)) {
    throw "Downloaded archive did not contain the codex-cortex-manager skill."
}

$installResult = $null
if ($InstallSystemSkill) {
    if (-not $ApproveInstall) {
        [ordered]@{
            status = "approval_required"
            requiredApproval = "install"
            check = $check
            downloadRoot = $DownloadRoot
            downloadedSkill = $sourceSkill
            message = "Download complete. Review the downloaded package before installing. Re-run with -InstallSystemSkill -ApproveInstall only after explicit approval."
        } | ConvertTo-Json -Depth 8
        return
    }

    $installResult = Copy-SkillToCodexHome -SourceSkill $sourceSkill -TargetCodexHome (Get-SafeCodexHome -RequestedCodexHome $CodexHome)
}

[ordered]@{
    status = $(if ($InstallSystemSkill) { "installed" } else { "downloaded" })
    check = $check
    downloadRoot = $DownloadRoot
    archive = $zipPath
    downloadedSkill = $sourceSkill
    installedSkill = $installResult
    nextStep = $(if ($InstallSystemSkill) { "Restart or refresh Codex if needed so future agents see the updated skill." } else { "Review the downloaded files, then ask for approval before installing." })
} | ConvertTo-Json -Depth 8
