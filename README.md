# Wiki-2-LuaTeX
Wiki-2-LuaTeX converts content from Wiki.js to high-quality PDFs using LuaLaTeX. It supports rich text formatting, custom templates, and advanced layout features, giving users full control over document styling and output. Ideal for automated PDF generation with sophisticated typographic control.

## How to use
In a terminal, simply run:
```sh
pandoc --lua-filter src/lua/diagram_filter.lua -s input.md -o output.tex --pdf-engine=lualatex
lualatex output.tex
```
where `input.md` is the input file from wiki.js, and `output.tex` is the output $\LaTeX$ file.
`lualatex` then compiles the `.tex` file into a `.pdf`.

## Requirements
- PlantUML: `sudo apt install plantuml` on debian based distros
- Mermaid CLI: `npm install -g @mermaid-js/mermaid-cli`
- Draw.io: [Link](https://github.com/jgraph/drawio-desktop/releases/tag/v24.7.17)
- Node.js & NPM: [Link](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)

## Quick start to LaTeX
A typical LaTeX file is structured into two main parts: the **preamble** and the **document body**. Here's a breakdown of both:

### 1. Preamble
This section contains the settings and configurations that will apply throughout the document. It is written before the `\begin{document}` line.

- **Document Class**: Defines the type of document (e.g., article, report, book).
  ```latex
  \documentclass{article}
  ```
  You can pass options to the class, such as font size or paper size:
  ```latex
  \documentclass[12pt,a4paper]{article}
  ```

- **Packages**: Used to import additional functionalities, like graphics, mathematical symbols, fonts, etc.
  ```latex
  \usepackage{amsmath}  % For better math environments
  \usepackage{graphicx} % For including images
  ```

- **Custom Commands & Settings**: You can define custom commands or set global settings for things like page layout, font styles, etc.
  ```latex
  \newcommand{\R}{\mathbb{R}}  % Defines a shortcut for the symbol ℝ
  \setlength{\parindent}{0pt}  % No indentation for paragraphs
  ```

### 2. Document Body
This is where the actual content of the document goes, enclosed between `\begin{document}` and `\end{document}`.

- **Sections**: LaTeX uses sectioning commands to divide the content.
  ```latex
  \section{Introduction}
  \subsection{Background}
  ```

- **Text**: Plain text is written as normal. You can also format it using commands.
  ```latex
  This is some \textbf{bold} text.
  ```

- **Mathematics**: Math can be inserted inline or in display mode using `$...$` for inline math and `\[ ... \]` for block/display math.
  ```latex
  Inline math: $E = mc^2$

  Display math:
  \[
  \int_0^\infty e^{-x} \, dx = 1
  \]
  ```

- **Figures and Tables**: You can include figures and tables using environments like `figure` and `table`.
  ```latex
  \begin{figure}[h]
    \centering
    \includegraphics[width=0.5\textwidth]{image.png}
    \caption{An example image}
    \label{fig:example}
  \end{figure}
  ```

- **References and Citations**: You can reference sections, figures, or citations.
  ```latex
  As shown in Figure~\ref{fig:example}, the results are clear.

  For citations:
  \cite{author2024}
  ```

### 3. Finalization
At the end of the file, you finish the document by using `\end{document}`. Anything after this command will be ignored by the LaTeX compiler.

### Example of a Simple LaTeX Document
```latex
\documentclass[12pt]{article}
\usepackage{amsmath}  % For math symbols
\usepackage{graphicx} % For including images
\usepackage{mhchem}   % For chemical equations

\title{My First Document with Images and Chemistry}
\author{John Doe}
\date{\today}

\begin{document}

\maketitle

\section{Introduction}
This is an introductory paragraph. Let's write some inline math: $a^2 + b^2 = c^2$.

\subsection{A Subsection}
Here is a displayed equation:
\[
E = mc^2
\]

\section{An Example Figure}
Below is an example image included in the document:

\begin{figure}[h]
    \centering
    \includegraphics[width=0.5\textwidth]{ert.png}
    \caption{An example placeholder image.}
    \label{fig:example-image}
\end{figure}

As shown in Figure~\ref{fig:example-image}, we can include images with captions and labels.

\section{A Chemical Reaction}
Here is an example of a chemical reaction:

\[
\ce{2H2 + O2 -> 2H2O}
\]

This is the reaction that produces water from hydrogen and oxygen.

\section{Conclusion}
This document demonstrates how to include equations, images, and chemical formulas.

\end{document}
```

This structure is very modular, making LaTeX powerful for creating well-organized academic and technical documents.
