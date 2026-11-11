# Build all CV variants into output/ (full + short for each language).
# Usage: ./scripts/build.ps1

$repoRoot  = Split-Path -Parent $PSScriptRoot
$outputDir = Join-Path $repoRoot "output"
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

Push-Location $repoRoot
try {
    foreach ($lang in @("en", "id")) {
        # Full version
        pdflatex -interaction=nonstopmode -halt-on-error -output-directory="$outputDir" "cv_$lang.tex"
        if ($LASTEXITCODE -ne 0) { throw "Build failed: cv_$lang (full)" }

        # Short version (no appointments): \short is defined from the command line
        pdflatex -interaction=nonstopmode -halt-on-error -output-directory="$outputDir" `
            -jobname="cv_${lang}_short" "\def\short{}\input{cv_$lang}"
        if ($LASTEXITCODE -ne 0) { throw "Build failed: cv_$lang (short)" }
    }

    # Reached only if every variant built successfully (a failure throws above),
    # so .log files stay available for debugging when something goes wrong.
    Remove-Item -Path (Join-Path $outputDir "*") -Include *.aux, *.log, *.out -Force
}
finally {
    Pop-Location
}

Write-Host "`nDone. PDFs are in output/." -ForegroundColor Cyan
