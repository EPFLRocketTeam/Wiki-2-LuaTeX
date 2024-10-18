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
