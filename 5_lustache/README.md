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
pandoc test.md test2.md --lua-filter=lustache-filter.lua -M firstName="Dave" -M firstday=true -M todolist="setup laptop|get key fob"
```

## Findings

After looking at `filter-regex` example, I attempted to create a custom reader to pre-process the document. This generally worked, but the meta data from the command-line was no where to be found.

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
