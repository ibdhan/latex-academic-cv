# Build script for Windows (PowerShell)
# This will compile all 4 CV versions automatically.

$repoRoot = Split-Path -Parent $PSScriptRoot
$outputDir = Join-Path $repoRoot "output"

if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

$files = @("cv_en_full.tex", "cv_en_short.tex", "cv_id_full.tex", "cv_id_short.tex")

Push-Location $repoRoot

foreach ($file in $files) {
    Write-Host "----------------------------------------" -ForegroundColor Yellow
    Write-Host "Building: $file" -ForegroundColor Green
    Write-Host "----------------------------------------"
    
    # Write build artifacts to output/ to keep the repo root clean.
    pdflatex -interaction=nonstopmode -output-directory="$outputDir" $file
    
    # Optional cleanup of auxiliary files (uncomment if you want to keep the directory clean)
    # Remove-Item ($file -replace "\.tex$", ".aux") -ErrorAction SilentlyContinue
    # Remove-Item ($file -replace "\.tex$", ".log") -ErrorAction SilentlyContinue
    # Remove-Item ($file -replace "\.tex$", ".out") -ErrorAction SilentlyContinue
}

Pop-Location

Write-Host "`nAll builds complete! PDFs are in output/." -ForegroundColor Cyan
