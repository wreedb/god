Numbers
=======

Numbers in **God** are neither specifically intergers, doubles nor floats. 
They can be any of them; In *Nix*, integers have an upper and lower boundary 
of `9223372036854775807` and `-9223372036854775807` respectively, as they are 
[two's complement](https://en.wikipedia.org/wiki/Two%27s_complement) signed integers. **God** mimics this behavior, albeit 
slightly simpler due to all data here being completely static.
```god
age = 26;
age-negative = -26;
pi = 3.14;
pi-negative = -3.14;
exp = 0.27e13;
```

In practice, a *number* is a sequence of one or many numeric digits, it may 
be used with a leading negation operator, and may use lower and upper-case 
exponent notation.
```god
decimal-exp = -.5e10;
decimal-negative-exp = -.123E-5;
```

~~~admonish important
Not all programming languages can represent these limits effectively; therefore 
the implementer should document any deviations from these limits clearly for 
their users.

If the technical details needed for proper usage are not documented by the 
implementation, the implementation **MAY NOT** claim to be compliant with 
this specification.
~~~
