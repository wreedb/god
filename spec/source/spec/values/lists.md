Lists
=====

These are a grouping of any number of [elements](elements.md). They may be the 
element assigned to a field, or nested within another list as one of its' 
elements. They are delimited by opening and closing "square" brackets (`[ ]`).
The elements contained are separated by [whitespace](../structure/whitespace.md).

They have no strict type requirements for their elements, meaning it can hold 
numbers, strings, maps and other lists.

```god
favorite-movies = [
    "Interstellar"
    "The Witch"
    "Kill Bill Vol. 1"
];

list-of-lists = [
    [ 1 2 3 ]
    [ true false null ]
    [ "foo" "bar" ]
    [
        { name = "Will"; age = 26; }
        { name = "Floyd"; age = 29; }
    ]
];
```
~~~admonish note
As you can see in the above examples, field termination is required when 
within the fourth `list-of-list` element, since *maps contain fields*; but 
the maps themselves are only elements, meaning they do not require field 
termination. For more clarification, see [maps](maps.md) and [fields](../structure/fields.md).
~~~
