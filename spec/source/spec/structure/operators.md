Operators
=========

The following symbols are *operators* in God:

Assignment
----------
This is the operator that denotes an [identifier](identifiers.md) being **assigned** a value.
It is written as an equal sign.
```god
thing = "value";
```
Termination
-----------
These are the integral final part of a field; distinguishing where a given field ends.
They are are required to terminate **all** fields. They are written as a semi-colon.
```god
numbers = { one = 1; two = 2; three = 3; };
```

Negation
--------
These are used as a prefix to number values; denoting the negativity of the number in question.
```god
negative-numbers = [ -1 -2 -3 -3.14 ];
positive-numbers = [ 1 2 3 3.14 ];
```
