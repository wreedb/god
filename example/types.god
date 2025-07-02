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
