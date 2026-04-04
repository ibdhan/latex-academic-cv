# Build script for Windows (PowerShell)
# This will compile all 4 CV versions automatically.

$files = @("cv_en_full.tex", "cv_en_short.tex", "cv_id_full.tex", "cv_id_short.tex")

foreach ($file in $files) {
    Write-Host "----------------------------------------" -ForegroundColor Yellow
    Write-Host "Building: $file" -ForegroundColor Green
    Write-Host "----------------------------------------"
    
    # Run pdflatex. Interaction=nonstopmode ensures it doesn't wait for input on errors.
    pdflatex -interaction=nonstopmode $file
    
    # Optional cleanup of auxiliary files (uncomment if you want to keep the directory clean)
    # Remove-Item ($file -replace "\.tex$", ".aux") -ErrorAction SilentlyContinue
    # Remove-Item ($file -replace "\.tex$", ".log") -ErrorAction SilentlyContinue
    # Remove-Item ($file -replace "\.tex$", ".out") -ErrorAction SilentlyContinue
}

Write-Host "`nAll builds complete!" -ForegroundColor Cyan
