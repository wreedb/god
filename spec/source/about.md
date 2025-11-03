Why?
----
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
