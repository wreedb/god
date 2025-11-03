Comments
========

Comments in God only come in one variety, line comments:
```god
# this is a line comment, occupying an entire line.
name = "Will"; # this is another line comment, occupying only the end of the line
```

Despite **Nix** supporting multi-line and mid-statement comments, **God** does 
not. In practice, any meaning that can be conveyed through comments can be 
conveyed well enough by line comments (whether they occupy a full line or 
only the end of one), making the other types unnecessary.

Terminology explanation
-----------------------

Terminology regarding comments has garnered a lot of misconception; so in an 
effort to make it perfectly clear, here are the different types of comments,
using `C` as the language to demonstrate.

Multi-line "Block" comments:
```c
int main() {
    /* this is foo
     * it equals two
     * */
    int foo = 2;
    return 0;
}
```
Line comments:
```c
int main() {
    // this is foo
    int foo = 2; // it equals two
    return 0;
}
```

Mid-statement comments:
```c
int main() {
    int /* this is foo, it equals two */ foo = 2;
    return 0;
}
```

As stated above, **God** only supports *line comments*, the other types are invalid.
