Identifiers
===========

These are unquoted text denoting the name or *identity* of a field.

Identifiers may not contain any of the following standard symbols:
- `.`: period
- `%`: percent sign
- `$`: dollar sign, as well as other localized currency symbols
- `@`: at sign
- `!`: exclamation point
- `^`: caret
- `&`: ampersand
- `*`: asterisk
- `"`: double-quote
- `` ` ``: backtick/grave
- `~`: tilde
- `[]`: opening and closing square brackets
- `{}`: opening and closing curly braces
- `()`: opening and closing parenthesis
- `,`: comma
- `+`: plus/addition sign
- `=`: equal sign
- `><`: angle brackets (greater/lesser than signs)
- `?`: question mark
- `\/`: back and forward slashes
- `;`: semi-colon

Identifiers **may not** begin with:
- `-`: hypen
- `'`: single-quote
- `0-9`: numeric digits

They however, may *contain* and be *suffixed* by:
- `-`: hyphen
- `'`: **unpaired** single-quote
- `_`: underscore

Outside of these limits, any amount of digits (0-9), and letters (A-Z, a-z) are allowed.

```god
# containing hyphens/underscores
abc-123 = "fa so la ti do";
abc_123 = null;
    
# suffixed by hyphens/underscores
abc-123- = "fa so la ti do";
abc_123_ = null;

# highly impractical, but valid
a'b'c'1'2'3 = "do re mi";
a_-_b-'_'-c'1_2-'3' = { crazy = true; };
```

~~~admonish warning
The use of non-ASCII Unicode characters (emojis, non-Latin characters, 
accented characters, etc.) in identifiers is **invalid**. While support for 
non-English languages would be desirable, implementation difficulty, 
security concerns, and lack of expertise with non-Latin scripts make 
this a strict limitation for the foreseeable future.
~~~
