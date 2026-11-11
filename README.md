# Academic CV (LaTeX)

CV akademik dalam bahasa Inggris dan Indonesia, masing-masing tersedia dalam versi **full** dan **short**.
Gaya tampilan terinspirasi dari format CV fakultas Georgia Tech.

PDF hasil build ada di [`output/`](output/):

| | Full | Short (tanpa appointments) |
|---|---|---|
| English | `cv_en.pdf` | `cv_en_short.pdf` |
| Indonesia | `cv_id.pdf` | `cv_id_short.pdf` |

## Struktur

```text
.
├── cv_en.tex / cv_id.tex   # entry point per bahasa: daftar section yang ditampilkan
├── style.tex               # layout, package, dan format section (dipakai bersama)
├── sections/
│   ├── en/                 # header, research, appointments, education, funding, publications
│   └── id/                 # (isi sama, bahasa Indonesia)
├── scripts/build.ps1       # build semua varian ke output/
└── output/                 # PDF hasil build
```

## Cara kerja

Setiap `cv_<lang>.tex` mengatur `\lang` lalu memuat `style.tex` dan section dari `sections/<lang>/`.
Untuk menyembunyikan atau menambah section, cukup ubah baris `\input{...}` di file tersebut.

Versi short dibuat dengan mendefinisikan `\short` dari command line; satu-satunya bedanya adalah
section *appointments* tidak ditampilkan.

## Build

Butuh distribusi LaTeX (TeX Live / MiKTeX) dengan `pdflatex` di PATH.

```powershell
./scripts/build.ps1
```

Atau satu per satu:

```powershell
pdflatex cv_en.tex                                   # full
pdflatex -jobname=cv_en_short "\def\short{}\input{cv_en}"   # short
```

## Menambah section baru

Section lain (awards, talks, teaching, students, service) sudah tidak ada di versi ini, tetapi
masih tersimpan di Git: lihat tag `v1-legacy`, mis. `git show v1-legacy:sections/en/awards.tex`.
Salin ke `sections/en/` dan `sections/id/`, lalu tambahkan `\input{...}` di `cv_en.tex` / `cv_id.tex`.
