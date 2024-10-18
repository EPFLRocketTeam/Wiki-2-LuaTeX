local pandoc = require 'pandoc'
local system = require 'pandoc.system'

function CodeBlock(block)
  local file_name = os.tmpname() .. ".png"

  if block.classes[1] == "plantuml" then
    local uml_file = os.tmpname() .. ".puml"
    local file = io.open(uml_file, "w")
    file:write(block.text)
    file:close()
    
    -- Use os.execute to run the PlantUML command
    os.execute("plantuml -tpng " .. uml_file)
    
    -- Return LaTeX to include the generated image
    return pandoc.RawBlock("latex", "\\includegraphics{" .. uml_file:gsub("%.puml", ".png") .. "}")

  elseif block.classes[1] == "mermaid" then
    local mmd_file = os.tmpname() .. ".mmd"
    local file = io.open(mmd_file, "w")
    file:write(block.text)
    file:close()
    
    -- Use os.execute to run the Mermaid command
    os.execute("mmdc -i " .. mmd_file .. " -o " .. file_name)
    
    return pandoc.RawBlock("latex", "\\includegraphics{" .. file_name .. "}")

  elseif block.classes[1] == "drawio" then
    local drawio_file = os.tmpname() .. ".drawio"
    local file = io.open(drawio_file, "w")
    file:write(block.text)
    file:close()
    
    -- Use os.execute to run the draw.io command
    os.execute("drawio --export --output " .. file_name .. " " .. drawio_file)
    
    return pandoc.RawBlock("latex", "\\includegraphics{" .. file_name .. "}")
  end
end

