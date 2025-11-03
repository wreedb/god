Elements
========
An element is a raw [value](../values-index.md), either as a the assigned value of a 
[field](fields.md), or an item in a [list](../values/lists.md). They can be any of the 
fundamental data types.

```god
things = [ 
    "string"
    1
    null
    false
    ''
      Multi-line
      string
    ''
    [ "another" "list" ]
    { text = "another map"; }
];
```
In this example, the following parts are *elements*:
- `"string"`
- `1`
- `null`
- `'' ... Multi-line string ... ''` (abbreviated)
- `[ "another" "list" ]`
  - `"another"`
  - `"list"`
- `{ text  = "a map"; }`
  - `"a map"`
