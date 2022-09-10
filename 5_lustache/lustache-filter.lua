local lustache = require('lustache')
local logging  = require('logging')

function Pandoc(doc)
    local blocks = pandoc.List()   

    -- loop through input files
    local data = transform_meta(doc.meta)
    local files = PANDOC_STATE.input_files
    for i = 1, #files do
        local transformed = apply_transform(files[i], data)
        blocks:extend(transformed)
    end

    return pandoc.Pandoc(blocks, doc.meta)
end

function apply_transform(file, data)
    local raw    = read_file(file)
    local parsed = lustache:render(raw ,data)
    return pandoc.read(parsed).blocks
end

function read_file(path)
    local file = io.open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

function transform_meta(meta)
    local data = {}
    for k,v in pairs(meta) do
        if pandoc.utils.type(v) == "Inlines" then
            data[k] = pandoc.utils.stringify(v)
        elseif tostring(v):find("|") then
            data[k] = split(v, '|')
        else
            data[k] = v
        end
    end

    logging.info("Transformed meta:", data)

    return data
end

function split(pString, pPattern)
    local result = {}  -- NOTE: use {n = 0} in Lua-5.0
    local fpat = "(.-)" .. pPattern
    local last_end = 1
    local s, e, cap = pString:find(fpat, 1)
    while s do
       if s ~= 1 or cap ~= "" then
        table.insert(result,cap)
       end
       last_end = e+1
       s, e, cap = pString:find(fpat, last_end)
    end
    if last_end <= #pString then
       cap = pString:sub(last_end)
       table.insert(result, cap)
    end
    return result
 end