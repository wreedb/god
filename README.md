# GOD, a language for *good ol' data*
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
            name = "Floyd";
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

---
**Table of Contents**
+ [Why?](#a-why)
+ [Background](#a-background)
  + [Benefits](#a-background-benefits)
+ [Specification](#a-specification)
  + [Values](#a-values)
    + [Strings](#a-values-strings)
    + [Numbers](#a-values-numbers)
    + [Booleans](#a-values-booleans)
    + [Null](#a-values-null)
    + [Maps](#a-values-maps)
      + [Variations](#a-values-maps-variations)
        + [Contiguous](#a-values-maps-variations)
        + [Non-contiguous](#a-values-maps-variations)
        + [Both](#a-values-maps-both)
    + [Lists](#a-values-lists)
    + [Elements](#a-values-elements)
  + [Structure](#a-structure)
    + [Document](#a-structure-document)
    + [Operators](#a-structure-operators)
      + [Selection](#a-structure-operators-selection)
      + [Termination](#a-structure-operators-termination)
    + [Identifiers](#a-structure-identifiers)
    + [Fields](#a-structure-fields)
    + [Whitespace](#a-structure-whitespace)
      + [Comments](#a-structure-whitespace-comments)

---
<a id="a-why"></a>
## Why
As someone who has found themself needing to manually write and programatically 
work with data serialization formats, I wanted a better way. I tried many 
formats: JSON, YAML, TOML, CSV, XML, KDL, Lua tables, Java properties, and 
others. You name it, I tried it. Many of them had enough nagging issues to 
cause motivation in me to find a better format, which never arose. 

### *"But JSON works fine"*
Have you ever been in the position of *writing* JSON, rather than just having a 
library parse it? If you haven't; then yes that's a logical conclusion. Personally, 
I find myself in a position where I need to write data manually, and many of the 
popular formats make that experience have more friction than it should. 
For those that may need a data serialization format, but never (or rarely) have 
to deal directly with the data in its storage format, it may seems like nit-picking; 
however it becomes different when you find yourself manually writing in these formats.

---
<a id="a-background"></a>
# Background
If you feel that *GOD* syntax is familiar, that's probably because *it is*. *GOD* 
isn't a new syntax; it is derived directly from the [Nix](https://nixos.org) programming language. 
Any valid *GOD* code can be validated directly by Nix, with `nix eval -f file.god`. I saw no need 
to create a new language when I realized Nix had exactly the *bones* needed to derive a flexible 
(and easy to understand) data serialization format. *GOD* is a subset of Nix which omits it's 
programming syntax and features in favor of static data representation. 
<a id="a-backgound-benefits"></a>
Some of the benefits include:
+ It can be validated by `nix`
+ Conversion from *GOD* to [JSON](https://json.org) with `nix`
+ A number of existing tools for working with Nix code can be used
  + a [tree-sitter](https://github.com/nix-community/tree-sitter-nix) grammar
  + linters and formatters such as [statix](https://git.peppe.rs/languages/statix) and [nixfmt](https://github.com/nixos/nixfmt)
  + language servers such as [nixd](https://github.com/nix-community/nixd), [nil](https://github.com/oxalica/nil) and [rnix-lsp](https://github.com/nix-community/rnix-lsp)
  + Plugins for Nix syntax built-in to editors and cli tools
    + [bat](https://github.com/sharkdp/bat): `bat file.god -l nix`
    + [(neo)vim modelines](https://vim.fandom.com/wiki/Modeline_magic#Examples): `# vim:ft=nix`
  + A very thoroughly written [Emacs mode](https://github.com/nixos/nix-mode)


<a id="a-specification"></a>
# Specification

<a id="a-values"></a>
## Values
The value types in *GOD* are intentionally [rudimentary](https://www.dictionary.com/browse/rudimentary), 
with the goal of being useful to almost any programming language. They are flexible and have few restrictions.

---
<a id="a-values-strings"></a>
#### Strings
These come in two forms: standard and multiline. A standard or regular string is represented by a pair 
of double quotes with any amount of text inside it.
```nix
greeting = "Hello, how are you?";
```
Multiline strings are denoted by two pairs of double single-quotes (`'' hi ''`). They 
represent text that may spans across multiple lines. One subtlety to note, is that the string 
will be *left justified* to the furthest left line (*indentation-wise*) in the string. Essentially 
trimmed to the left-most part of the string as its' base. 
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
Yog can escape (double) quotes in a regular string using backslashes (`\`) before the indended character you're escaping  
```nix
height = "6'2\"";
# 6'2"
```
Escaping in multiline strings is done with a pair of single quotes, followed by a backslash (`''\`), to escape any character that would otherwise not be allowed within the string.
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
<a id="a-values-numbers"></a>
#### Numbers
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
As in Nix, floats are able to represent up to 64 bits of precision; which is typically 
enough for most applications. Any number (float or integer) which is not correctly 
represented in Nix, would not be correctly represented in *GOD* by extension. 

---
<a id="a-values-booleans"></a>
#### Booleans
These are represented as the unquoted keywords `true` and `false`. They are not 
reserved keywords, meaning they *can* be used as identifiers, though this is discouraged for obvious reasons.
```nix
{
    happy = true;
    sad = false;

    # discouraged, but technically valid
    false = true;
}
```

---
<a id="a-values-booleans"></a>
#### Null
This can correlate to a languages' `null` value, or to represent the absence of a 
value in languages which do no have a `null` type. In some languages it might also 
be represented by things such as a `false` boolean value, empty string (`""`), 
zero (`0`) or an empty list (`'()`, such as in lisp-style languages). However 
this would be an implementation-specific detail.  
```nix
{
    name = "Will";
    age = 26;
    friends = [
        {
            name = "Floyd";
            age = 29;
            friends = null;
        }
        {
            name = "Alice";
            age = 29;
            friends = [ { name = "Jada"; age = null; friends = null; } ];
        }
    ];
}
```

---
<a id="a-values-maps"></a>
#### Maps
A data structure which is known by many names in different languages. 
Lua [tables](https://www.lua.org/pil/2.5.html), 
Python [dictionaries](https://docs.python.org/3/tutorial/datastructures.html#dictionaries), 
Perl [hashes](https://perldoc.perl.org/perldata#DESCRIPTION), 
Javascript [objects](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_objects), 
Lisp and Scheme [association lists](https://standards.scheme.org/corrected-r7rs/r7rs-Z-H-8.html#TAG:__tex2page_sec_6.4). 
The commonality is the structure of an identifier which is assigned a group of fields.  
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
            name = "Floyd";
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
Some languages allow identifiers being used more than once in their form of a map, 
with the last occurence determining its' value; However this is not valid in 
Nix-- and by extension, here.
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

<a id="a-values-maps-variations"></a>
##### variations
Maps can be written in three ways; *contiguous*, *non-contiguous*, or both.

<a id="a-values-maps-variations-contiguous"></a>
###### Contiguous

```nix
{
    person = {
        name = "Will";
        age = 26;
        friends = null;
    };
}
```

<a id="a-values-maps-variations-non-contiguous"></a>
###### Non-contiguous

```nix
{
    person.name = "Will";
    person.age = 26;
    person.friends = null;
}
```
<a id="a-values-maps-variations-both"></a>
###### Both
Note that this only is valid in "forward" (left  right :: top  bottom) direction.  
The following **is** valid:
```nix
{
    person = {
        name = "Will";
        friends = null;
    };
    person.age = 26;
}
```
Wheras the following is **not** valid, because it is interpreted as `person` being defined twice.
```nix
{
    person.age = 26;
    # ERROR: person already defined
    person = {
        name = "Will";
        friends = null;
    };
}
```
---
<a id="a-values-lists"></a>
#### Lists
These are groups consisting of **[elements](#elements)**. The entire entity may 
be the value of a [field](#fields) or nested within another list as one of the 
its' elements. They are not strict about their elements' types, meaning they can 
contain any number of valid values. The contained elements are separated 
by any combination of [whitespace](#whitespace)
```nix
{
    favorite-foods = [
        "Tacos"
        "Pasta"
        "Sandwiches"
    ];

    favorite-numbers = [ 1 2 3 ];

    favorite-lists = [
        [ 1 2 3 ]
        [ "four" "five" "six" ]
        [ true false null ]
    ];

    interesting-list = [
        "Hello!"
        1984
        false
        [ 1998 2025 ]
        {
            name = "map";
            message = "I'm inside a list!";
            more = ''
            So I still adhere to the normal
                field termination rules!
            '';
            my-list = [
                "Hi!"
                true
                {
                    name = "another-map";
                    message = [ { text = "The nesting knows no limit!"; } 10 false ];
                }
                150
            ];
        }
        null
    ];
}
```

---
<a id="a-values-elements"></a>
#### Elements
These are [values](#values) within [lists](#lists). They are not associated with an identifier, 
only implicitly associated to their index in the list. Elements can be strings, numbers, booleans, 
null, maps or lists. Elements may *NOT* be [fields](#fields) however, [maps](#maps) contained 
within lists; by definition, have fields, and still adhere to the normal rules of 
**[field termination](#termination-operator)** within thier scope.

---
<a id="a-structure"></a>
## Structure
<a id="a-structure-document"></a>
### Document
Similar to formats like JSON, the top (outer-most) level of a **GOD** file is a pair of opening and closing *"curly"* braces `{  }`, 
which we will call the *document*. Within, [fields](#fields) are allowed in any order, with any valid 
values at any depth. In representation, it is semantically equivalent to a [map](#maps)-type [element](#elements)

---
<a id="a-structure-operators"></a>
### Operators

<a id="a-structure-operators-selection"></a>
#### Selection operator
The use of a period (`.`) in an identifier is used to selectively traverse map hierarchy. The part 
of the identifier prefixing the selection operator is considered a [map](#maps), and the postfix 
*(or postfixes)* are the [identifiers](#identifiers) of the maps' [fields](#fields).
```nix
{
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

<a id="a-structure-operators-termination"></a>
#### Termination operator
All fields **must** have a `;` (semicolon) to terminate its' scope.

- map assingments: `map = { };`
- simple assignments: `name = "Will";`
- list assignments: `list = [];`

**NOTE**: The [document](#document) is *not* a field, and therefore has no field terminator.

---
<a id="a-structure-identifiers"></a>
### Identifiers
Non-quoted string values denoting the *name* or *identity* of a field.  
These are the rules for identifiers:
##### Identifiers **MAY NOT**:
+ __contain__ the following symbols
  + ``% $ @ ! ^ & * " ` ~ + = , ? < > \ / ( ) [ ] { } ;``
+ __begin__ with the following symbols
  + `. '`
##### Identifiers **MAY**:
+ contain and be suffixed by (non-paired) single quote characters
+ contain and be suffixed by hyphens and underscores
+ contain (but not **begin** or **end** with) periods, as the [selection operator](#selection-operator).
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

---
<a id="a-structure-fields"></a>
### Fields
These consist of an [identifier](#identifiers) and their assigned value. Anything that isn't a [document](#document), 
[element](#elements), [operator](#operators) or [whitespace](#whitespace) is a field.
```nix
name = "Will";
hobbies = [ "programming" "movies" "music" ];
physical = {
    age = 26;
    height = "6'2\"";
};
```
In this example, the following are *all* fields, each one comprising the fields' 
identifier and assigned value. Note the selective omission of the semicolon 
[field terminators](#termination-operator) in this list, as they aren't part of the field itself; they are an [operator](#operators).
+ `name = "Will"`
+ `hobbies = [ "programming" "movies" "music" ]`
+ `physical = { age = 26; height = "6'2\""; }`
+ `age = 26`
+ `height = "6'2\""`

| Identifier | Assigned value                     |
|------------|------------------------------------|
| name       | `"Will"`                           |
| hobbies    | `["programming" "movies" "music"]` |
| physical   | `{ age = 26; height = "6'2\""; }`  |
| age        | `26`                               |
| height     | `"6'2\""`                          |

---
<a id="a-structure-whitespace"></a>
### Whitespace
All of the following are considered "whitespace" in a *GOD* file:
+ space characters `\x20`
+ tab characters `\t`
+ line-feed (LF) `\n`
+ carriage-return `\r`
+ carriage-return line-feed (CR LF) `\r\n`
+ line-feed carriage-return (LF CR) `\n\r`
+ record separator (RS) `\036`
+ [comments](#comments)

<a id="a-structure-whitespace-comments"></a>
#### Comments
In addition to omitting the programming features of Nix, we also ***only*** support one form of comments in __GOD__: _full_ line comments.
```nix
# this is a full line comment
{
    # this is another full line comment
    # and another one.
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
           'block' comment
        */
        { name = "Floyd"; }
    ];
}
```
When parsing *GOD*, encountering a line containing whitespace with its' first character being 
an *octothorpe* `#`, the remainder of the line is considered whitespace and is ignored.

#### Reasoning
This was an intentional choice. In the authors' opinion, this can make parsing easier and 
faster (in terms of performace and development time) for implementations of the spec, without 
sacrificing usability for those writing the serialized data. Anything that can be conveyed by 
multiline, inline and sub-line comments can be achieved well enough with full line comments.

## License
**GOD** (the specification) is licensed under the the GNU Free Documentation License, version 1.3. 
Being that this is only the *specification*, this doesn't place any restrictions on implementing it. 
Any contributions (or derivatives; of the specification, not the language or its' implementation) 
to this document/repository must also be licensed under the FDL 1.3. This does not 
mean using the *GOD* language or implementing it, the FDL 1.3 terms apply to this repository 
and document alone.
