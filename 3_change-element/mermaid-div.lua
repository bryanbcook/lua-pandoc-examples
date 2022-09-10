local logging = require('logging')

function Div(elem)
    if elem.classes:includes('mermaid') then
        local text = ""
        elem:walk({
            SoftBreak = function(el)
                text = text .. '\n'
                return nil
            end,
            Str = function(el)
                text = text .. pandoc.utils.stringify(el.text)
                return nil
            end,
            Space = function(el)
                text = text .. ' '
                return nil
            end
        })
        print(text)
        return pandoc.CodeBlock(text, elem.attr, elem.classes)
    else
        return elem
    end
end