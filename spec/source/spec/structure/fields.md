Fields
======

These are the most common and fundamental pieces of data in the language.

They are a combination of four parts:
- [identifier](identifier.md): the name of the field
- [assignment](operators.md#assignment) operator: to assign the name to a value
- [element](elements.md): the fields' *assigned value*
- [termination](operators.md#termination): to end the field declaration

```god
name = "Will";
favorite-things = [ "Movies" "Programming" ];
favorite-movie = {
    title = "Interstellar";
    director = "Christopher Nolan";
    release-year = 2014;
    leading-roles = [
        {
            character = "Joseph Cooper";
            actor = "Matthew McConaughey";
        }
        {
            character = "Dr. Amelia Brand";
            actor = "Anne Hathaway";
        }
    ];
};
```
In this example, there are 11 fields in total. Let's break down the biggest one:
```god
favorite-movie = {
    title = "Interstellar";
    director = "Christopher Nolan";
    release-year = 2014;
    leading-roles = [
        {
            character = "Joseph Cooper";
            actor = "Matthew McConaughey";
        }
        {
            character = "Dr. Amelia Brand";
            actor = "Anne Hathaway";
        }
    ];
};
```
Here, there are nine total fields including the `favorite-movies` map.
Within it, there are eight fields:
| identifier     | assigned value                          |
|----------------|-----------------------------------------|
| title          | string `"Interstellar"`                 |
| director       | string `"Christopher Nolan"`            |
| release-year   | number `2014`                           |
| leading-roles  | an list containing two maps as elements |

The first element of `leading-roles`:
| identifier | assigned value                 |
|------------|--------------------------------|
| character  | string `"Joseph Cooper"`       |
| actor      | string `"Matthew McConaughey"` |

The second element of `leading-roles`
| identifier | assigned value                 |
|------------|--------------------------------|
| character  | string `"Dr. Amelia Brand"`    |
| actor      | string `"Anne Hathaway"`       |

~~~admonish important
It is an important distiction that the two elements within the `leading-roles` list are **NOT** fields; they are elements that *contain fields*.
~~~
