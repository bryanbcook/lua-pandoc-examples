# Lustache

Wouldn't it be awesome if we could do conditional markdown using mustache syntax?

```markdown
# Hello {{firstName}}

{{#firstday}}
Here's your welcome package
{{/firstday}}

Here's a list of things to do:

{{#todolist}}
* {{.}}
{{/todolist}}
```

```shell
pandoc test.md test2.md \
      --lua-filter=lustache-filter.lua \
      -M firstName="Dave" \
      -M firstday=true \
      -M todolist="setup laptop|get key fob"
```

## Findings

After looking at `custom-reader` example, I attempted to create a custom reader to pre-process the document. This generally worked, but I couldn't find a way to get at the meta data:

```lua
local lustache = require('lustache')

function Reader(raw)
    local data = { name ='hello'}
    local doc = pandoc.read(tostring(raw))
    local input = lustache:render(tostring(raw), doc.meta)
    return pandoc.read(tostring(input))
end
```

Instead, I implemented this as a basic lua-filter and re-interpretted all the input-documents in a `Pandoc(doc)` block. The list of input files are available in the `PANDOC_STATE.input_files`

```lua
function Pandoc(doc)
    local blocks = {}
    -- loop through input files
    local fies = PANDOC_STATE.input_files
    for i = 1, #files do
        local raw = read_file(file)
        local parsed = lustache:render(raw, doc.meta)
        blocks:extend(pandoc.read(parsed).blocks)
    end
    return pandoc.Pandoc(blocks, doc.meta)
end
```

For processing lists of data, I needed a simple way to pass the list from the `-M` command-line argument. I ended up passing values as a pipe-delimited (`|`) string and processing the meta in the filter.

In one of my scenarios, I have multiple input files and one of the files contains all the link definitions. In this scenario, it might make more sense to concatenate the raw content of the files together and then reprocess them.
