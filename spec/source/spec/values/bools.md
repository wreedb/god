Booleans
========
Boolean values in **God** are written as the unquoted text `true` and `false`.
As in almost any context related to computer science, booleans are a data type
used to describe something that has one of two possible values; most commonly 
`true`/`false` and `1`/`0`.

```god
yes = true;
no = false;
```

Some languages may have unconventional boolean data types, and therefore the 
implementer may want to use the closest analogue in their language, for example, in Emacs Lisp:
```lisp
(setq foo t)
(setq bar nil)
```
There is not `false` boolean type in the language. There is `t` to represent a 
*truthy* value, and the `nil` keyword is often used in place of a *falsy*
value.

~~~admonish warning
Due to the permissiveness of [identifiers](../structure/identifiers.md) in **God** (as well as in **Nix**), it 
is completely valid to use `true`, `false` and even `null` as identifiers. 
```god
true = false;
false = null;
```
Using identifiers that use the same name as built-in language types is 
highly discouraged for obvious reasons, however they are documented here 
for the purposes of completeness.
~~~
