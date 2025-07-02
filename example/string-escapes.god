# -*- mode: nix; -*- vim:ft=nix
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
