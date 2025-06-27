# GOD, a language for *good ol' data*: specification version 0.0.1
Data serialization can be better, without being too much.

```nix
{
    name = "Will";
    age = 26;
    married = false;

    favorite-movies = [
        {
            title = "Interstellar";
            starring = [ "Matthew McConaughey" "Jessica Chastain" "Anne Hathaway" ];
            director = "Christopher Nolan";
            year = 2014;
        }
        {
            title = "Kill Bill: Volume 1";
            director = "Quinten Tarantino";
            starring = [
                { actor = "Uma Thurman";     character = "The Bride"; }
                { actor = "Lucy Liu";        character = "O-Ren Ishii"; }
                { actor = "David Carradine"; character = "Bill"; }
            ];
            year = 2003;
        }
        {
            title = "The Witch";
            director = "Robert Eggers";
            starring = [ "Anya Taylor-Joy" "Ralph Ineson" ];
            year = 2015;
        }
    ];
    
    friends = [
        {
            name = "Ross";
            age = 29;
            married = true;
            favorite-movies = [
                {
                    title = "The Departed";
                    starring = [ "Leonardo DiCaprio" "Vera Farmiga" "Matt Daemon" ];
                    director = "Martin Scorsese";
                    year = 2006;
                }
                {
                    title = "Training Day";
                    starring = [ "Denzel Washington" "Ethan Hawke" ];
                    director = "Antoine Fuqua";
                    year = 2001;
                }
                {
                    title = "Shutter Island";
                    starring = [ "Leonardo DiCaprio" "Mark Ruffalo" ];
                    director = "Martin Scorsese";
                    year = 2010;
                }
            ];
            friends = [];
        }
    ];
}
```

## Why
As someone who has found themself needing to write, and also programatically  
work with data serialization, I wanted a better way. I tried many formats;  
JSON, Yaml, Toml, CSV, XML, KDL, Lua tables, Java properties, and others.  
You name it, I tried it. Many of them had enough nagging issues to cause  
motivation in me to find a better format, which never came.

### "But JSON works fine"
For those that may need a data serialization format, but never (or rarely)  
have to deal directly with the data in its storage format, it may seems like  
nit-picking; however it's different when you find yourself manually writing  
in these formats.  

---
# Origin
If you feel that *GOD* syntax is familiar, that's probably because *it is*.  
*GOD* isn't a new syntax; it is derived directly from the [Nix](https://nixos.org) programming  
language. Any valid *GOD* code can be validated directly by Nix, with  
`nix eval -f file.god`. I saw no need to create a new language when I realized  
Nix had exactly the *bones* needed to derive a flexible (and easy to understand)  
data serialization text format. Therefore, *GOD* is a subset of Nix which omits  
it's programming syntax and features in favor of static data representation.

Some of the benefits include:
+ can be validated by `nix`  
+ can be converted to [JSON](https://json.org) with `nix`
+ A number Existing tools for working with Nix code can be used  
  + a [tree-sitter](https://github.com/nix-community/tree-sitter-nix) grammar
  + linters and formatters such as [statix](https://git.peppe.rs/languages/statix) and [nixfmt](https://github.com/nixos/nixfmt)
  + language servers such as [nixd](https://github.com/nix-community/nixd), [nil](https://github.com/oxalica/nil) and [rnix-lsp](https://github.com/nix-community/rnix-lsp)
  + Plugins for Nix syntax built-in to editors and cli tools
    + [bat](https://github.com/sharkdp/bat): `bat file.god -l nix`
    + [(neo)vim modelines](https://vim.fandom.com/wiki/Modeline_magic#Examples): `# vim:ft=nix`
  + A very thoroughly written [Emacs mode](https://github.com/nixos/nix-mode)

---
## Values
The value types in *GOD* are intentionally [rudimentary](https://www.dictionary.com/browse/rudimentary), with the goal of  
an ability to be useful to almost any program language in basic way. They are  
flexible and have few restrictions  

###### Strings
These come in two forms: standard and multiline. A standard or regular string  
is represented by a pair of double quotes with any amount of text inside it.  
```nix
greeting = "Hello, how are you?";
```
Multiline strings are denoted by two pairs of double single-quotes (`'' hi ''`).  
They represent text that spans across multiple lines. One important thing to  
note, is that the string will be *left justified* to the furthest left line
indentation-wise in the string, essentially left trimmed to the left-most part
of the string as its' base.
```nix
greeting = ''
    Hello
        How are you?
'';
### is interpreted as:
# |Hello
# |    How are you?
### rather than:
# |    Hello
# |        How are you?
###
```
Yog can escape (double) quotes in a regular string using backslashes (`\`)  
before the indended character you're escaping  
```nix
height = "6'2\"";
# 6'2"
```
Escaping in multiline strings is done with a pair of single quotes, followed  
by a backslash (`''\`), to escape any character that would otherwise not be  
allowed within the string.
```nix
greeting = ''
Typically,
    I greet people by saying ''\"Hey, how are you?''\"
'';
# |Typically,
# |    I greet people by saying "Hey, how are you?"
greeting-two = ''
It would be strange if I:
    greeted people by saying ''\'''\'
'';
# |It would be strange if I:
# |    greeted people by saying ''
```

---
###### Numbers
These can represent 64-bit signed integers and [IEEE 754](https://en.wikipedia.org/wiki/IEEE_754) floating point integers
```nix
{
    # integer
    age = 26;
    age-negative = -26;
    # float
    pi = 3.14159;
    pi-negative = -3.13159;
}
```
As in Nix, floats are able to represent up to 64 bits of precision; which is  
typically enough for most applications. Any number (float or integer) which is  
not correctly represented in Nix, would not be correctly represented in *GOD* by  
extension.  

This could be worked around at the implementation/application level by wrapping  
the value as a string when you're certain you programming language can properly  
handle such values.

---
###### Booleans
These are represented as the unquoted keywords `true` and `false`. They are not  
reserved keywords, meaning they *can* be used as identifiers, though this is  
not recommended for obvious reasons.
```nix
{
    happy = true;
    sad = false;

    # This is valid, though discouraged
    false = true;
}
```

---
###### Null
This can correlate to a languages' *null/nil* value, or to represent the absence  
of a value in languages which do no have a null/nil type. In some languages it  
might also be represented by things such as a `false` boolean value, empty  
string, zero (`0`) or an empty list (`'()`, such as in lisp-style languages).  
However this would be an implementation-specific detail.  
```nix
{
    name = "Will";
    age = 26;
    friends = [
        {
            name = "Ross";
            age = 29;
            friends = null;
        }
        {
            name = "Brooke";
            age = 29;
            friends = [ { name = "Manny"; age = null; friends = null; } ];
        }
    ];
}
```

---
###### Maps
A data structure which is known by many names in different languages.  
Lua [tables](https://www.lua.org/pil/2.5.html), Python [dictionaries](https://docs.python.org/3/tutorial/datastructures.html#dictionaries), Perl [hashes](https://perldoc.perl.org/perldata#DESCRIPTION), Javascript [object literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_objects),  
Lisp and Scheme's [association lists](https://standards.scheme.org/corrected-r7rs/r7rs-Z-H-8.html#TAG:__tex2page_sec_6.4). The commonality is the structure of an  
identifier which is assigned a group fields.  
```nix
{
    self = {
        name = "Will";
        age = 26;
        married = false;
        favorite-songs = [
            { artist = "Slint"; title = "Nosferatu Man"; }
            { artist = "OutKast"; title = "Hey Ya!"; }
        ];
        best-friend = {
            name = "Ross";
            age = 29;
            married = true;
            favorite-songs = [
                { artist = "Tool"; title = "Lateralus"; }
                { artist = "Deafheaven"; title = "Dream House"; }
            ];
        };
    };
}
```
Some languages allow identifiers being used more than once in a map data  
structure, with the last occurence to determine its' value; However this  
is not valid in Nix-- and by extension, here.
```nix
{
    self = {
        name = "Will";
        age = 26;
        
        # This is an ERROR
        age = 25;
    };

    # this is also an ERROR
    self.age = 25;
}
```
They can be written in one of three ways; contiguously, non-contiguously,  
or a mix of both. The selection operator `.`, can be used in an identifier name  
to denote the prefix being a map and the suffix being a value; This can be done  
at multiple levels to denote nested hierarchy.
<a id="hierarchy"></a>
```nix
{
    ## contiguous
    person = {
        name = "Will";
        age = 26;
        friends = null;
    };

    ## non-contiguous
    person.name = "Will";
    person.age = 26;
    person.friends = null;

    ## mixed
    person = {
        name = "Will";
        friends = null;
    };
    person.age = 26;


    ## hierarchy levels
    # the following:
    movies = {
        horror = {
            period-piece = [
                "The Witch"
                "The Lighthouse"
            ];
        };
    };
    # could also be written as:
    movies.horror.period-piece = [ "The Witch" "The Lighthouse" ];

}
```

---
###### Lists
These are groups consisting of *[elements](#elements)* (values not directly assigned to an  
identifier). The entire entity may be assigned to an identifier as its' value  
or nested within another list without an identifier.  
```nix
{
    movies = [
        "Interstellar"
        "Dune"
        "The Witch"
        [ "Hereditary" "Midsommar" "The Lighthouse" ]
    ];
}
```
They are not strict about their elements types, meaning they can contain any  
number of valid [values](#values).
```nix
{
    things = [
        { type = "Map"; nested = true; }
        
        null
        
        [ 1 2 3 "Nested List" false null true ]
        
        false
        
        "An example string"
        
        ''
        an example
            multiline
                string
        ''
    ];
}
```
List elements are separated by whitespace, from any of the following sources:  
1. one or many newlines
2. one or many spaces
3. one or many tabs
4. any combination of 1, 2 and 3

---
## Structure
<a id="document-anchor"></a>
Similar to formats like JSON, the top (outer-most) level of a **GOD** file  
is a pair of opening and closing braces `{  }`, which we will call the  
*document*. Within, [fields](#fields) are allowed in any order, with  
any valid values, and to any depth.

---
### Identifiers
These are non-quoted string values denoting the *name* or *identity* of
a field. Here are the rules of identifiers:
##### Identifiers may **NOT**:
__contain__ the following symbols
- ``% $ @ ! ^ & * " ` ~ + = , ? < > \ / ( ) [ ] { }``
__begin__ with the following symbols
- `. '`
##### Identifiers **MAY**:
- contain and be suffixed by (non-paired) single quote characters
- contain and be suffixed by hyphens and underscores
- contain (but not *begin* or *end* with) periods; to represent **[hierarchy](#hierarchy)**.

#### Example: identifiers
```nix
{
    # containing hyphens/underscores
    abc-123 = "fa so la ti do";
    abc_123 = null;
        
    # suffixed by hyphens/underscores
    abc-123- = "fa so la ti do";
    abc_123_ = null;
    
    # impractical; just for demonstrating capability
    a'b'c'1'2'3 = "do re mi";
    a_-_b-'_'-c'1_2-'3' = { crazy = true; };
    
    # the following
    person.name = "Will";
    person.age = 26;

    # is equivalent to
    person = {
        name = "Will";
        age = 26;
    };
}
```

### Fields
These consist of an [identifier](#identifiers) and their assigned value(s).  
Anything that is not a [document](#document-anchor) or list [element](#elements) are fields.  
```nix
name = "Will";
hobbies = [ "programming" "movies" "music" ];
physical = {
    age = 26;
    height = "6'2\"";
};
```
In this example:
+ `name = "Will"`
+ `hobbies = [ "programming" "movies" "music" ]`
+ `physical = { }`, (truncated for brevity)
+ `age = 26`
+ `height = "6'2\""`
are all **fields**, each one comprising of its' identifier and assigned value


| Identifier | Assigned value                     |
|------------|------------------------------------|
| name       | `"Will"`                           |
| hobbies    | `["programming" "movies" "music"]` |
| physical   | `{ age = 26; height = "6'2\""; }`  |
| age        | `26`                               |
| height     | `"6'2\""`                          |

##### Terminators
Anything considered a **field** must have a `;` (semicolon) to terminate it.

- map assingments: `map = { };`
- simple assignments: `name = "Will";`
- list assignments: `list = [];`

A field must have an [identifier](#identifier), even if the identifier is  
arbitrary, such as `_ = { name = "Will"; };`.

##### NOTE
The *[document](#document-anchor)* is *not* a field, and therefore; it has no  
field terminator. Similarly, values inside of a list are not fields, as the  
internal values of a list are not assigned to an identifier alone. It may be  
useful to think of the document as if it were a map contained inside of a list,  
thus not being terminated.

### Lists
A list is a *[value](#values)*, which contains **elements**. They can be assigned  
to an **identifier** to comprise a field. They are delimited by square  
braces and terminated by semicolons `[ ];`. They may contain any mixture  
of value types as its' *elements*, including more lists (in which case, a  
nested list would *not* be terminated; as it is not a field in that context).

###### Elements
These are **values** within **lists**. They are not associated with an
identifier, only their index in the order of the list. Elements can
be strings, numbers, booleans, null, blocks, or even more lists. Elements may  
NOT be [fields](#fields), though they may contain [maps](#maps) which in turn may  
contain fields.

###### NOTE
Elements are separated by whitespace; by methods such as:      
- one or many spaces
- one or many tabs
- one or many newlines        
However, blocks contained within lists still adhere to the normal  
rules of **[field termination](#terminators)**.

#### Example: lists
```nix
{
    favorite-foods = [
        "Tacos"
        "Pasta"
        "Sandwiches"
    ];

    favorite-numbers = [ 1 2 3 ];

    favorite-list = [
        [ 1 2 3 ]
        [ 4 5 6 ]
    ];

    interesting-list = [
        "Hello!"
        1984
        false
        [ 1998 2025 ]
        {
            name = "block";
            message = "I'm inside a list!";
            more = ''
            So I still adhere to the normal
            field termination rules!
            '';
            my-list = [
                "Hi!"
                true
                {
                    name = "another-block";
                    message = "The nesting knows no limit!";
                }
                150
            ];
        }
        null
    ];
}
```

---
## Comments
Other than omitting programatic features of Nix, we also only support one form  
of comments in *GOD*; __full__ line comments.
```nix
# this is a full line comment
{
    # this is another full line comment
    name = "Will";
}
```
The following comments (which are valid in Nix), are __*NOT*__ valid in *GOD*:
```nix
{
    name = "Will"; # invalid comment
    favorite-things = [ "a" "b" "c" /* invalid comment */ 1 2 3 ];
    friends = [
        /* invalid
           multiline
           block comment
        */
        { name = "Ross"; }
    ];
}
```
When parsing *GOD*, encountering a line containing whitespace with it's first  
character being an *octothorpe* `#`, the remainder of the line is considered  
whitespace and is ignored.

###### Reasoning
This was an intentional choice which (in the authors opinion) can make parsing  
easier and faster (in terms of performace and development time) for  
implementations of this spec; without sacrificing usability for those writing  
the serialized data. Anything that can be conveyed by multiline, inline and  
sub-line comments can be achieved well enough with full line comments; there  
simply is rarely ever a *need* for more than that.
