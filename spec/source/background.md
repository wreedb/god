Background
==========
If you feel that **God** syntax is familiar, that's probably because *it is*. **God**
isn't a new syntax; it is derived directly from the [Nix](https://nixos.org) programming language.
Any valid **God** code can be validated directly by Nix, with `nix eval -f file.god`. I saw no need
to create a new language when I realized Nix had exactly the *bones* needed to derive a flexible
(and easy to understand) data serialization format. **God** is a subset of Nix which omits it's
programming syntax and features in favor of static data representation.

Some of the benefits include:
- It can be validated by `nix`
- Conversion from *GOD* to [JSON](https://json.org) with `nix eval -f file.god --json`
- A number of existing tools for working with Nix code can be used
  + linters and formatters such as [statix](https://git.peppe.rs/languages/statix) and [nixfmt](https://github.com/nixos/nixfmt)
  + language servers such as [nixd](https://github.com/nix-community/nixd), [nil](https://github.com/oxalica/nil) and [rnix-lsp](https://github.com/nix-community/rnix-lsp)
  + A very thoroughly written [Emacs mode](https://github.com/nixos/nix-mode)

If you would like to see some sample document files, see the [examples](examples.md) page.
