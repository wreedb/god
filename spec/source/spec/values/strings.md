Strings
=======

Regular
-------
A standard or regular string is represented by a pair of double quotes with any amount of text inside it.
```god
greeting = "Hello, how are you?";
```

Multi-line
----------
Strings that span across multiple lines are supported. They are define using 
two sets of single quotes; one at the beginning and one at the end.
```god
about-me = ''
  Let me tell you
  about myself!
'';
```

~~~admonish note
Multi-line string are also indentation aware; The indentation of the contained 
string is calculated relative to the *furthest left* column which contains 
meaningful (non-whitespace) text.
```god
my-string = ''
    There are four spaces before this,
      but the they will not be preserved.
'';
# produces:
# "There are four spaces before this,\n  but they will not be preserved.\n"
```
~~~

### Escaping
Yog can escape (double) quotes in a regular string using a backslash (`\`) before it. This is the same
for line-feeds, carriage returns and tab characters (`\n`,`\r`,`\t`).
To escape **any** character, prefix it with `''\`
```god
height = "6'2\"\n";
# produces:
# 6'2"\n
greeting = ''
  I said ''\'Hello!''\'
    to them.
'';
# produces:
# "I said 'Hello!'"\n  to them."
```

~~~admonish warning
The whitespace and newline on the opening line after `''` are ignored if there 
is no meaningful (non-whitespace) text or characters on said initial line.
Also, leading tab (`\t`) characters are not stripped from the beginning of the 
line, so it is best practice to use spaces within multiline strings unless 
this is desired.
~~~
