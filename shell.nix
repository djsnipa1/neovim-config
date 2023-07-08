{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell {
  buildInputs = [
    nixpkgs-fmt
    nixfmt
    alejandra
    gh-markdown-preview
    lua-language-server
    stylua
    luaformatter
    nil
    statix
    lua54Packages.luacheck
    nodejs
    nodePackages.prettier_d_slim
  ];

  shellHook = ''
    # ...
  '';
}
