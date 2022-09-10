# Logging

## About

Here's a 101 thing to answer the question, "how does this work?".  Let's start with some logging.

I've downloaded the logging implementation from here: <https://github.com/wlupton/pandoc-lua-logging>

This experiment attempts to determine the order of elements as they're processed.  

```shell
pandoc test.md -t markdown -o dummy.md --lua-filter=1_logging.lua
```

> **Tips**:
>
> Add `-verbose` to see _info_ statements.
>
> Pipe the console log to a file by adding *> test.out

## Findings

- As per [typewise-traversal](https://pandoc.org/lua-filters.html#typewise-traversal) Items are processed in the following order:

  - All Inline elements (Str, etc) in the order they appear
  - The Inlines filter (all elements in the order they appear)
  - All Block elements (Header, Para, Table) in the order they appear
  - The Blocks filter (all Blocks from inside to out)
  - Meta
  - Pandoc

- I'm using the logging library mentioned above, but you can easily use `io.stderr:write()` or `print()`