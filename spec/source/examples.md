Examples
========

These can all be found in the `example/` directory of the project's [Git repository](https://github.com/wreedb/god).

---
`simple.god`
```god
{
    name = "Will";
    age = 26;
    numbers = [ 9 -45 3.14 ];
    special = {
        yes = true;
        no = false;
        none = null;
    };
    
    long-string = ''
        Hello
        there!
    '';
}
```
---
`package.god`
```god
{
    name = "shepherd";
    version = "1.0.5";
    licensing = [ "GPL-3.0-or-later" ];
    
    links = {
        home = "https://gnu.org/software/shepherd";
        repo = "https://codeberg.org/shepherd/shepherd.git";
    };
    
    tag = {
        release = true;
        name = "v1.0.5";
    };

    foreign = [
        "usr/share/doc/shepherd-1.0.5"
        "usr/share/guile/site/3.0/shepherd"
        "usr/lib/guile/3.0/site-ccache/shepherd"
        "usr/libexec/shepherd"
    ];
}
```
---
`types.god`
```god
{
    name = "Will";
    nums = [ 1 2 3 true false null "string" ];

    mapping = { age = 26; };

    yes = true;
    no = false;
    nothing = null;

    things = {
        one = true;
        zero = false;
        nada = null;
        list = [ true false null "string" 1 2 3 { map = "self"; catch = 22; lie = true; } ];
    };

    list-of-maps = [
        {
            string-with-escapes = "\"\\there should be a single slash at the beginning when interpreted and this would be entirely quoted and\r\n\tindented on a new line here as well.\"";
            list-within-map-within-list = [ 1 2 3 true false null "\"escaped quotes\"" ];
        }
        {
            more = "less";
        }
    ];

}
```
---
`directions.god`
```god
{
    directions = [
        {
            name = "north";
            cardinal = true;
        }
        {
            name = "east";
            cardinal = true;
        }
        {
            name = "west";
            cardinal = true;
        }
        {
            name = "south";
            cardinal = true;
        }
        {
            name = "down";
            cardinal = false;
        }
    ];
}
```
---
`deep.god`
```god
{
    user = {
        name = "Will";
        age = 26;
        married = false;
        friends = [
            {
                name = "Floyd";
                age = 29;
                married = true;
                favorite-numbers = [ 1 2 -3.14 false null true "Hello!" 69 ];
                qualities = {
                    emotional = [ "patient" 1 "nice" null ];
                };
            }
        ];
    };
}
```
---
`complex.god`
```god
{
    name = "Will";
    age = 26;
    married = false;
    favorite-movies = [
        {
            title = "Interstellar";
            director = "Christopher Nolan";
        }
        {
            title = "Kill Bill Volume 1";
            director = "Quinten Tarantino";
        }
    ];
    friends = [
        {
            name = "Floyd";
            age = 29;
            married = false;
            favorite-movies = [
                {
                    title = "Training Day";
                    director = null;
                }
                {
                    title = "The Departed";
                    director = "Martin Scorcese";
                }
            ];
            friends = [];
        }
    ];
}
```
---
`string-escapes.god`
```god
{
    string = "normal string";
    special-strings = [
        "\"\\entirely quoted with a single slash at the start and\r\n\tnewline + indent here.\""
        "\" \\ this should quoted with slashes on both sides \\ \""
        "\\tabs\t\\and\t\\slashes\t\\with\t\\every\t\\word."
        "\nline-feeds above and below\n"
        "\r\ncarriage-return/line-feeds above and below\r\n"
        "\rcarriage-returns on both sides\r"
    ];
}
```
