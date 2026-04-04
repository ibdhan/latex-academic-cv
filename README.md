# Academic CV — LaTeX Template

A clean, modular, and multi-language LaTeX CV template for academic use, inspired by the Georgia Tech faculty CV style. This repository supports both English and Indonesian versions, with "Full" and "Short" variants for each.

## Features

- **Multi-language Support**: English (`en`) and Indonesian (`id`) sections.
- **Configurable Length**: Toggle between Full and Short versions using LaTeX flags.
- **Modular Design**: Content is split into logical sections (Education, Publications, etc.) for easy maintenance.
- **Automation**: Includes a PowerShell script to build all four CV variants at once.

## Project Structure

```text
.
├── output/              # Generated build files (PDF, log, aux, ...)
├── scripts/
│   └── build_all.ps1    # PowerShell script to compile all versions
├── sections/            # Modular content files
│   ├── en/              # English sections
│   └── id/              # Indonesian sections
├── cv_style.tex         # Layout, packages, and custom commands
├── main.tex             # Main driver that loads sections based on flags
├── cv_en_full.tex       # Entry point: English, Full CV
├── cv_en_short.tex      # Entry point: English, Short CV
├── cv_id_full.tex       # Entry point: Indonesian, Full CV
├── cv_id_short.tex      # Entry point: Indonesian, Short CV
└── README.md
```

## How It Works

The template uses a "Wrapper" system. Each entry point (e.g., `cv_en_full.tex`) defines two variables before inputting `main.tex`:

```latex
\def\lang{en}       % Set language: 'en' or 'id'
\newif\iffullcv     % Define the 'fullcv' flag
\fullcvtrue         % Set to \fullcvtrue or \fullcvfalse
\input{main}        % Load the main driver
```

`main.tex` then uses these flags to `\input` the correct files from the `sections/` directory.

## Getting Started

### Prerequisites
You need a LaTeX distribution installed (e.g., TeX Live, MiKTeX, or MacTeX) with `pdflatex` available in your PATH.

### Building
You can compile individual files using your preferred LaTeX editor, or use the provided script to build everything:

```powershell
./scripts/build_all.ps1
```

## Customization

### Styling
Modify `cv_style.tex` to change margins, fonts, colors, or section header formatting.

### Custom Commands
The template provides helper commands to keep the content files clean:
- `\entry{Left Text}{Right Text}`: Creates a two-column row (e.g., for education or jobs).
- `\award{Year}{Award Name}{Venue/Notes}`: A specialized entry for honors and awards.

## Dependencies
Standard packages only — no custom `.sty` files needed:
`geometry`, `titlesec`, `tabularx`, `hyperref`, `enumitem`, `parskip`, `microtype`, `etoolbox`.
