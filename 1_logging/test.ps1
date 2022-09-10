# show the order that elements are processed and pipe into a dummy file.
pandoc ..\_docs\sample.md -t markdown --lua-filter=logging-filter.lua -o dummy.md 

remove-item dummy.md