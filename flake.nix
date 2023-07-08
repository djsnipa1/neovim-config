{
  description = "my project description";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-21.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, treefmt-nix }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs-unstable.legacyPackages.${system};
    in {
      devShell = import ./shell.nix { inherit pkgs; };

      formatter = treefmt-nix.lib.mkWrapper
        nixpkgs.legacyPackages.${system}
        {
          projectRootFile = "flake.nix";
          programs.nixpkgs-fmt.enable = true;
          programs.stylua.enable = true;
          programs.alejandra.enable = true;
        };
    });
}

