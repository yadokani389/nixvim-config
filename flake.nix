{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
    neovim-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { nixpkgs, nixvim, flake-utils, neovim-overlay, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        config = import ./config { inherit pkgs neovim-overlay; };
        nixvim' = nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = config;
        };
      in { packages.default = nvim; });
}
