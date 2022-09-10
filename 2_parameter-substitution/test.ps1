# show the order that elements are processed and pipe into a dummy file.
pandoc test.md -t markdown --lua-filter=subst.lua -M myArg:"hello world"