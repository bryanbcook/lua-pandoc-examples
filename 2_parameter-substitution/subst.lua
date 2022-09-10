local vars = {}

function Meta(meta)
    for k, v in pairs(meta) do
        vars["%" .. k .. "%"] = v
    end
end

function Str(elem)
    if vars[elem.text] then
        return vars[elem.text]
    else
        return elem
    end
end

return {
    { Meta = Meta },
    { Str  = Str  }
}
