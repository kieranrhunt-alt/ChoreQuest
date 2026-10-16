# Ship the latest FlutterFlow version of Squishie Chore Adventure to Codemagic.
#
#   powershell -ExecutionPolicy Bypass -File ship.ps1
#
# 1. Exports the newest code from FlutterFlow (includes edits made in the
#    FlutterFlow editor), 2. copies it into this repo (keeping codemagic.yaml,
#    branding/ and these scripts), 3. commits and pushes to GitHub main.
# The push starts the automatic Codemagic builds: Android test APK and
# iOS TestFlight.
$ErrorActionPreference = 'Stop'
$repo = $PSScriptRoot
$workspace = Split-Path $repo -Parent
$generated = Join-Path $workspace 'generated_code'

Write-Host '1/3  Exporting the latest code from FlutterFlow...' -ForegroundColor Cyan
Push-Location $workspace
try {
  flutterflow ai codegen refresh
  if ($LASTEXITCODE -ne 0) { throw 'FlutterFlow export failed.' }
} finally {
  Pop-Location
}

Write-Host '2/3  Copying it into the repo...' -ForegroundColor Cyan
robocopy $generated $repo /MIR /NFL /NDL /NJH /NJS /NP `
  /XD '.git' 'branding' '.dart_tool' 'build' '.flutterflow' 'ephemeral' `
  /XF 'codemagic.yaml' 'sync_from_flutterflow.sh' 'ship.ps1' '.gitignore' '.gitattributes' '.flutter-plugins' '.flutter-plugins-dependencies' | Out-Null
if ($LASTEXITCODE -ge 8) { throw "Copy failed (robocopy exit $LASTEXITCODE)." }

Write-Host '3/3  Committing and pushing to GitHub...' -ForegroundColor Cyan
Push-Location $repo
try {
  git add -A
  git diff --cached --quiet
  if ($LASTEXITCODE -eq 0) {
    Write-Host 'No changes since the last build - nothing to ship.' -ForegroundColor Yellow
    return
  }
  $stamp = Get-Date -Format 'yyyy-MM-dd HH:mm'
  git -c user.name='ChoreQuest' -c user.email='noreply@chorequest.local' commit -q -m "Sync from FlutterFlow ($stamp)"
  git push origin main
  if ($LASTEXITCODE -ne 0) { throw 'git push failed.' }
  Write-Host 'Shipped! Codemagic is now building the Android APK and the TestFlight build.' -ForegroundColor Green
} finally {
  Pop-Location
}
