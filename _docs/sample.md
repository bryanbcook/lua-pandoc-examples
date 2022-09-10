---
about: markdown sample doc
tags:
- tag1
- tag2
- tag3
---
# Example

## Blocks

### Paragraph

Here's a paragraph

### Bulleted List

- apple
- orange
- banana

### Numbered List

1. First
1. Second
1. Third

### Codeblock

``` powershell
# a code block
write-host "hello world"
```

### Div

:::mermaid
Content inside a div
:::

### Table

| Column 1 Header | Column 2 Header |
|-----------------|-----------------|
| Column 1 Value  | Column 2 Value  |

### BulletLists with Nested Content

- lists with nested content

    Such as a paragraph

- or maybe a list with nested lists

  - nested 1
    - nested 1a
  - nested 2

- or maybe a nested code block

    ``` shell
    pandoc -t -f
    ```

- or maybe a table

  | Col1 | Col2 |
  |------|------|
  | ValA | ValB |

> **Note**:
>
> This is a blockquote. Take note.

## Inline

### Citations

Pandoc supports citations [@pandoc-1]

### Emphasis

This is _emphasized_.

### Strong

This is **Strong**.

### Strikeout

You can ~~Strikeout~~ at bat.

### Code

This statement has a `Code` block in it.
