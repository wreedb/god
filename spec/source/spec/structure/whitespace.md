Whitespace
==========

The following are considered *whitespace* in **God**:

| name                    | value  |
|-------------------------|--------|
| space characters        | `\x20` |
| tab characters          | `\t`   |
| line-feed (LF)          | `\n`   |
| carriage-return (CR)    | `\r`   |
| [comments](comments.md) | Varied |

~~~admonish note
These characters will not be considered whitespace when used within [strings](../values/strings.md).
See the [warning](../values/strings.md#admonition-warning) for specific details related to the handling 
of multi-line strings.
~~~
