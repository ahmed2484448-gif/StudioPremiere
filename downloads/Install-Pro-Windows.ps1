# Installs QudsStudioSuite-Pro.zxp for the current user (no extra software needed).
$zxp = Join-Path $PSScriptRoot 'QudsStudioSuite-Pro.zxp'
$dest = Join-Path $env:APPDATA 'Adobe\CEP\extensions\com.ahmedamer.qudsstudiopro'
if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
New-Item -ItemType Directory -Force $dest | Out-Null
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zxp, $dest)
Write-Host "Installed to $dest - restart Premiere Pro, then Window > Extensions > Quds Studio Suite Pro"
