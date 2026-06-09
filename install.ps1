# Sage - Windows installer.
#
#   irm https://conifer.build/install.ps1 | iex
#
# Downloads the latest build and runs the installer. Nothing leaves your
# machine. View this script before running it - that's the whole point of it
# being a plain file. (macOS users: install.sh; Linux: the .AppImage.)
$ErrorActionPreference = 'Stop'

# Release asset (stable, version-less permalink). Mirrors lib/release.ts:
#   RELEASE_REPO = ConiferKit/sage, windows asset = Sage_x64-setup.exe
$ExeUrl = 'https://github.com/ConiferKit/sage/releases/latest/download/Sage_x64-setup.exe'
$Exe    = Join-Path ([System.IO.Path]::GetTempPath()) 'Sage_x64-setup.exe'

Write-Host ''
Write-Host '  Installing Sage...'
Write-Host ''

# Windows PowerShell 5.x defaults to TLS 1.0; GitHub's download host needs 1.2.
try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 } catch {}

Write-Host '  -> downloading'
Invoke-WebRequest -Uri $ExeUrl -OutFile $Exe -UseBasicParsing

Write-Host '  -> launching installer'
# Unsigned build: SmartScreen may warn until the cert is added -
# choose "More info" -> "Run anyway".
Start-Process -FilePath $Exe -Wait

Write-Host ''
Write-Host '  Done - Sage is installed. Launch it from the Start menu.'
Write-Host ''
