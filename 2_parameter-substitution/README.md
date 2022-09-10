# Parameter Substitution

This experiment is a basic parameter substitution taking values from meta.

```bash
pandoc ../_docs/sample.md -t markdown --lua-filter=subst.lua -M myArg="hello world"
```

This example shows that we can supply the traversal order of the filter by returning their order in the filter:

```lua
return {
    { Meta = <name-of-function> },
    { Str  = <name-of-function>  }
}
```
