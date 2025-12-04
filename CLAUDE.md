# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Japanese LaTeX thesis template for undergraduate graduation theses at Yazaki Lab, University of Electro-Communications (電気通信大学 矢崎研究室). The template uses uplatex and produces PDFs via dvipdfmx.

## Build Commands

### Standard Build
```bash
make
```
Or explicitly:
```bash
latexmk -r latexmkrc thesis.tex
```

### Watch Mode (Auto-rebuild on changes)
```bash
make watch
```

### Clean Build Artifacts
```bash
make clean
```

### Manual BibTeX Workflow
If you need to manually rebuild with bibliography updates:
```bash
platex thesis.tex
pbibtex thesis
platex thesis.tex
platex thesis.tex
```
Note: `make` handles this automatically via latexmk.

## Document Structure

- **Main file**: `thesis.tex` - Contains document setup, packages, and includes all sections
- **Content sections**: `sections/` directory
  - `1-abstract.tex` - Abstract (概要)
  - `2-introduction.tex` - Introduction (はじめに)
  - `3-background.tex` - Background (背景知識)
  - `4-suggest.tex` - Proposed Method (提案手法)
  - `5-evaluation.tex` - Evaluation (評価)
  - `7-final.tex` - Conclusion (おわりに)
  - `8-appendix.tex` - Appendix (付録)
- **Bibliography**: `export.bib` - BibTeX references using ipsjunsrt style
- **Figures**: `fig/` directory - Store all images and diagrams here

## LaTeX Configuration

### Build System
- Uses `latexmkrc` for build configuration
- Compiler: `uplatex` (Unicode-aware pLaTeX)
- Bibliography: `upbibtex`
- PDF generation: `dvipdfmx` (pdf_mode = 3)
- Max build iterations: 5 passes

### Document Class and Key Packages
- Base class: `ujarticle` (Japanese article)
- Font size: `mag=1200` (12pt equivalent)
- Margins: 42mm top, 20mm bottom, 21mm left/right
- Graphics: `graphicx` with dvipdfmx driver
- Hyperlinks: `hyperref` with dvipdfmx driver
- Code listings: `listings` with `jlisting`
- Bibliography style: `ipsjunsrt` (IPSJ unsorted style)

### Custom Commands
The template defines custom bibliography commands for Japanese/English:
- `\urlj` - Japanese URL notation (入手先)
- `\urle` - English URL notation (available from)
- `\refdatej` - Japanese access date (参照)
- `\refdatee` - English access date (accessed)

## CI/CD (GitHub Actions)

### Automatic Build Trigger
Pushes to `main` branch that modify:
- `thesis.tex`
- `sections/*`
- `export.bib`
- `.github/workflows/build.yaml`

### Build Process
1. Runs in `aruneko/texlive` container
2. Executes `latexmk thesis.tex`
3. Creates GitHub Release with timestamp tag (format: `YYYYMMDDHHmm`)
4. Attaches generated `thesis.pdf` to release

## Editing Guidelines

### Title Page Information
Edit in `thesis.tex` (lines 125-145):
- Academic year (令和XX年度)
- Thesis title
- Student ID number
- Student name
- Submission date

### Section Naming
The template uses numbered sections but note that section 6 (考察/Discussion) is commented out. The numbering jumps from section 5 to section 7.

### Figure References
Place figures in `fig/` directory and reference using standard LaTeX:
```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.8\linewidth]{fig/filename.pdf}
  \caption{Caption text}
  \label{fig:label}
\end{figure}
```

### Bibliography Entries
Add references to `export.bib` using BibTeX format. The template uses `ipsjunsrt.bst` style file for IPSJ (Information Processing Society of Japan) formatting.
