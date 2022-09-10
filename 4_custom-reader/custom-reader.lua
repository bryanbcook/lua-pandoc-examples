
function Reader(raw)
    local input = string.gsub(tostring(raw), ":::mermaid(.*):::", "~~~mermaid%1~~~")
    return pandoc.read(input)
end