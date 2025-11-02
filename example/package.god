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
