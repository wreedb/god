Document
========

The *document* is used to describe the starting and ending boundaries of data 
in a **God** file. It is delimited by opening and closing "curly" braces 
(`{ }`). There can only be one set of document-level delimiters in a God file. 

```god
{ # document begins here
    name = "Will";
    hobbies = [ "Programming" "Watching Movies" "Playing Video Games" ];
} # document ends here
```
Within a *document*, any number of [fields](fields.md) are allowed in any order at any 
level of depth.

~~~admonish note
The *document* is not a field, therefore it **does not** use a [field termination operator](operators.md#termination).
~~~

As stated above, only one document-level set of delimiters are allowed, meaning 
the following example is **invalid**:
```god
{
    name = "Will";
}
{
    age = 26;
}
```
