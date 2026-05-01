param(
    [string]$Repository = "swpegasus/codex-cortex",
    [string]$Branch = "main",
    [int]$MaxChangelogLines = 60
)

$ErrorActionPreference = "Stop"

function Get-WebText {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Uri
    )

    $request = @{
        Uri = $Uri
        Headers = @{
            "User-Agent" = "Codex-Cortex-Update-Check"
        }
    }

    if ($PSVersionTable.PSVersion.Major -lt 6) {
        $request.UseBasicParsing = $true
    }

    return (Invoke-WebRequest @request).Content
}

function Get-FirstChangelogSection {
    param(
        [string]$Text,
        [int]$MaxLines
    )

    if ([string]::IsNullOrWhiteSpace($Text)) {
        return ""
    }

    $lines = $Text -split "`r?`n"
    $start = -1

    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match "^##\s+") {
            $start = $i
            break
        }
    }

    if ($start -lt 0) {
        return ($lines | Select-Object -First $MaxLines) -join "`n"
    }

    $end = $lines.Count
    for ($i = $start + 1; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match "^##\s+") {
            $end = $i
            break
        }
    }

    return ($lines[$start..($end - 1)] | Select-Object -First $MaxLines) -join "`n"
}

function Get-LocalVersionInfo {
    $scriptParent = Split-Path -Parent $PSScriptRoot
    $candidates = @(
        (Join-Path $scriptParent "references\VERSION.json")
        (Join-Path $scriptParent "plugins\codex-cortex\.codex-plugin\plugin.json")
        (Join-Path $scriptParent ".codex-plugin\plugin.json")
    )

    foreach ($candidate in $candidates) {
        if (-not (Test-Path -LiteralPath $candidate -PathType Leaf)) {
            continue
        }

        $json = Get-Content -LiteralPath $candidate -Raw | ConvertFrom-Json

        if ($candidate.EndsWith("VERSION.json", [System.StringComparison]::OrdinalIgnoreCase)) {
            return [ordered]@{
                path = $candidate
                version = $json.pluginVersion
                sourceCommit = $json.sourceCommit
                generatedAt = $json.generatedAt
            }
        }

        return [ordered]@{
            path = $candidate
            version = $json.version
            sourceCommit = $null
            generatedAt = $null
        }
    }

    return [ordered]@{
        path = $null
        version = $null
        sourceCommit = $null
        generatedAt = $null
    }
}

$rawBase = "https://raw.githubusercontent.com/$Repository/$Branch"
$apiBase = "https://api.github.com/repos/$Repository"

$remoteManifestText = Get-WebText -Uri "$rawBase/plugins/codex-cortex/.codex-plugin/plugin.json"
$remoteManifest = $remoteManifestText | ConvertFrom-Json
$remoteChangelog = Get-WebText -Uri "$rawBase/CHANGELOG.md"
$localInfo = Get-LocalVersionInfo

$remoteCommit = $null
$remoteCommitDate = $null
try {
    $commit = Invoke-RestMethod -Uri "$apiBase/commits/$Branch" -Headers @{ "User-Agent" = "Codex-Cortex-Update-Check" }
    $remoteCommit = $commit.sha
    $remoteCommitDate = $commit.commit.committer.date
} catch {
    $remoteCommit = $null
    $remoteCommitDate = $null
}

$versionChanged = $false
if ($localInfo.version -and $remoteManifest.version) {
    $versionChanged = $localInfo.version -ne $remoteManifest.version
}

$commitChanged = $false
if ($localInfo.sourceCommit -and $remoteCommit) {
    $commitChanged = -not $remoteCommit.StartsWith($localInfo.sourceCommit, [System.StringComparison]::OrdinalIgnoreCase)
}

[ordered]@{
    repository = $Repository
    branch = $Branch
    localVersion = $localInfo.version
    localSourceCommit = $localInfo.sourceCommit
    localVersionSource = $localInfo.path
    remoteVersion = $remoteManifest.version
    remoteCommit = $remoteCommit
    remoteCommitDate = $remoteCommitDate
    updateAvailable = $versionChanged
    versionChanged = $versionChanged
    commitChanged = $commitChanged
    documentedChanges = Get-FirstChangelogSection -Text $remoteChangelog -MaxLines $MaxChangelogLines
    approvalRequiredBeforeDownload = $true
    nextStep = "Summarize documentedChanges for the user and ask for approval before running Update-CodexCortexFromGitHub.ps1 -ApproveDownload."
} | ConvertTo-Json -Depth 6
