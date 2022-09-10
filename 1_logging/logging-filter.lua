local logging = require('logging')

---
--- Pandoc Module: Pandoc
---
function Pandoc(blocks)
    logging.output('Pandoc --------------')
    logging.debug('pandoc blocks', blocks)
end

---
--- Pandoc Module: Meta
---
function Meta(table)
    logging.output('Meta-----------------')
    logging.info('meta table:', table)
end

---
-- Pandoc Module: Block
--
function BlockQuote(content)
    logging.output('BlockQuote-----------')
    logging.info('blockquote content:', content)
end

function BulletList(items)
    logging.output('BulletList-----------')
    logging.info('Bulletlist items:', items)
end

function CodeBlock(text)
    logging.output('CodeBlock------------')
    logging.info('Codeblock text:', text)
end

function DefinitionList(content)
    logging.output('DefinitionList-------')
    logging.info('DefinitionList content:', content)
end

function Div(content)
    logging.output('Div------------------')
    logging.info('Div content:', content)
end

function Header(content)
    logging.output('Header---------------')
    logging.info('Header content:', content)
end

function OrderedList(items)
    logging.output('OrderedList----------')
    logging.info('OrderedList items:', items)
end

function Para(content)
    logging.output('Para-----------------')
    logging.info('Para content:', content)
end

function Plain(content)
    logging.output('Plain---------------')
    logging.info('Plain content:', content)
end

function Table(table)
    logging.output('Table---------------')
    logging.info('Table table:', table)
end

---
--- Pandoc Module: Blocks
---
function Blocks(elements)
    logging.output('Blocks--------------')
    logging.info('Blocks elements:', elements)
end

---
--- Pandoc Module: Inline
--- (not all are represented here)

function Cite(content)
    logging.output("Cite----------------")
    logging.info('Cite', content)
end

function Code(text)
    logging.output('Code', text)
end

function Emph(content)
    logging.output('Emph', content)
end

function Span(content)
    logging.output('Span', content)
end

function Str(content)
    logging.output('Str', content)
end

function Stikeout(content)
    logging.output('Strikeout', content)
end

function Strong(content)
    logging.output('Strong', content)
end

---
--- Pandoc Module: Inlines
---
function Inlines(elements)
    logging.output('Inlines-------------')
    logging.info('Inlines:', elements)
end