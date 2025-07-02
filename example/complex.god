# -*- mode: nix; -*- vim:ft=nix
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
            name = "Ross";
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
