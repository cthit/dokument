{
  description = "This Nix flake creates a development shell that provides LaTeX, XeTeX and required packages";
  inputs.nixpkgs.url = "nixpkgs/nixos-26.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          gnumake
          (texlive.combine {
            # Some packages may be duplicated from the medium scheme
            inherit (texlive) scheme-medium latexmk babel changepage enumitem etoolbox fancyhdr float fontspec forloop geometry hyperref l3packages lastpage parskip pdfpages pgf readarray stringstrings titlesec verbatimbox todonotes;
          })
        ];
      };
    });
}
