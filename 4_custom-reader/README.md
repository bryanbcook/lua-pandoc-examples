# Custom Reader

This experiment attempts to use a `--filter` instead of a `--lua-filter` in order to process the raw markdown content using a [Custom Reader](https://pandoc.org/custom-readers.html).

```shell
pandoc test.md -t markdown -f custom-reader.lua
```

## Findings

This works, but some interesting pitfalls:

- `--lua-filter=custom-reader.lua` doesn't work at all. It's as though `Reader` is ignored.

- `--filter=custom-reader.lua` complains with `createProcess: invalid argument (Exec format error)`. This might be a reference to:
  
   > A previous pandoc version passed a raw string instead of a list of sources to the Reader function. Reader functions that rely on this are obsolete, but still supported: Pandoc analyzes any script error, detecting when code assumed the old behavior. The code is rerun with raw string input in this case, thereby ensuring backwards compatibility.

- only works when `-f custom-reader.lua` is specified.
