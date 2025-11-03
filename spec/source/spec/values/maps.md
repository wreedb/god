Maps
====
A map in **God** is a data structure that has an analogue in practically every programming language;
Lua [*tables*](https://www.lua.org/pil/2.5.html), 
Python [*dictionaries*](https://docs.python.org/3/tutorial/datastructures.html#dictionaries), 
Perl [*hash slices*](https://perldoc.perl.org/perldata#Key/Value-Hash-Slices), 
(Type/Java)script [*objects*](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object), 
[Lisp](https://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node153.html) and 
[Scheme](https://standards.scheme.org/corrected-r7rs/r7rs-Z-H-8.html#TAG:__tex2page_sec_6.4) *association lists*, 
and Java [HashMaps](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/HashMap.html) just to name a few.

The commonality is the structure of an *identifier* which is *assigned* a group of *fields*. Fields can be seen as 
key-value pairs in an abstract sense.

In **God** specifically, they are delimited by opening and closing "curly" 
braces (`{  }`). When they are used as just a field, they must be use a 
[termination operator](../structure/operators.md#termination); when used as an element, only any fields within it will 
require termination.

```god
me = {
    name = "Will";
    age = 26;
    married = false;
    favorite-songs = [
        { artist = "Slint"; title = "Nosferatu Man"; }
        { artist = "OutKast"; title = "Hey Ya!"; }
    ];
    best-friend = {
        name = "Floyd";
        age = 29;
        married = true;
        favorite-songs = [
            { artist = "Tool"; title = "Lateralus"; }
            { artist = "Deafheaven"; title = "Dream House"; }
        ];
    };
};
```
Any type of field is allowed within a map, so long as it follows any necessary rules of field termination.

~~~admonish warning
Some languages allow identifiers to be used more than once within a map 
or similar data structure, with the last occurrence determining its value. 
This is not valid in **God**.
```god
me = {
    name =  "Will";
    age = 26;
    age = 25; # this is an ERROR
};
```
~~~
