![God Logo](assets/favicon.png)

God, a language for *good ol' data*
===================================
Data serialization can be better, without being too much.
```god
{
  name = "Will";
  age = 26;
  married = false;

  favorite-movies = [
    {
      title = "Interstellar";
      starring = [
        "Matthew McConaughey"
        "Jessica Chastain"
        "Anne Hathaway"
      ];
      director = "Christopher Nolan";
      year = 2014;
    }
    {
      title = "Kill Bill: Volume 1";
      director = "Quinten Tarantino";
      starring = [
        { actor = "Uma Thurman"; character = "The Bride"; }
        { actor = "Lucy Liu"; character = "O-Ren Ishii"; }
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
