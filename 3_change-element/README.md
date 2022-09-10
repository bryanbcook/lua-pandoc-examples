# Change Element

This experiment converts a DIV to a CODEBLOCK using a lua-filter. Specifically, we're interested in 
converting Azure DevOps mermaid syntax to something that Pandoc can support.

Azure DevOps Format:

```markdown
:::mermaid
:::
```

Pandoc expects it to be a code fence with markdown language:

~~~markdown
 ```mermaid
 ```
~~~

## Findings

This experiment is partially successful. All white-space associated with the DIV is completely stripped out. Whitespace is only available in codeblocks.
