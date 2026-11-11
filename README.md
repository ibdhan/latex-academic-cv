# Academic CV (LaTeX)

An academic CV in English and Indonesian, each available as a **full** and a **short** version.
The layout is inspired by the Georgia Tech faculty CV style.

Compiled PDFs are in [`output/`](output/):

| | Full | Short (no appointments) |
|---|---|---|
| English | `cv_en.pdf` | `cv_en_short.pdf` |
| Indonesian | `cv_id.pdf` | `cv_id_short.pdf` |

## Structure

```text
.
├── cv_en.tex / cv_id.tex   # entry point per language: lists the sections to include
├── style.tex               # layout, packages, and section formatting (shared)
├── sections/
│   ├── en/                 # header, research, appointments, education, funding, publications
│   └── id/                 # same sections, in Indonesian
├── scripts/build.ps1       # builds all variants into output/
└── output/                 # compiled PDFs
```

## How it works

Each `cv_<lang>.tex` sets `\lang`, loads `style.tex`, and includes the sections from
`sections/<lang>/`. To hide or add a section, edit the corresponding `\input{...}` line in that file.

The short version is built by defining `\short` on the command line. The only difference from the
full version is that the *appointments* section is omitted.

## Building

Requires a LaTeX distribution (TeX Live or MiKTeX) with `pdflatex` on your PATH.

```powershell
./scripts/build.ps1
```

The script builds all four PDFs into `output/` and removes the auxiliary files (`.aux`, `.log`,
`.out`) once every variant has built successfully. If a build fails, those files are kept so you
can inspect them.

To build a single variant manually:

```powershell
pdflatex cv_en.tex                                          # full
pdflatex -jobname=cv_en_short "\def\short{}\input{cv_en}"   # short
```

## Adding more sections

Earlier versions of this repo included awards, talks, teaching, student advising, and professional
service sections. They were removed to keep the CV simple, but they are still available in Git under
the tag `v1-legacy`, for example:

```bash
git show v1-legacy:sections/en/awards.tex
```

Copy the file into `sections/en/` and `sections/id/`, then add an `\input{...}` line to
`cv_en.tex` and `cv_id.tex`.
