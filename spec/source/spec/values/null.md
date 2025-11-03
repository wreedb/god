# Null

Written as the unquoted text `null`, this value represents nothing.

This may correlate to a languages' `null` value, or represent the absence of a 
value in languages which do not have a `null` type. In some languages this may 
be best represented by `0` or an empty list (`'()`) as in some lisp style languages.
```god
nothing = null;
```
It is at the discretion of the implementer to decide what makes the most sense 
for their use case and the capabilities of their language.

As described in [booleans](bools.md#admonition-warning), `null` is able to be used as an identifier,
though highly discouraged.
