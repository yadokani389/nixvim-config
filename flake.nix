{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
    neovim-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixvim, flake-utils, neovim-overlay, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (final: prev: {
              rust-analyzer-unwrapped =
                prev.rust-analyzer-unwrapped.overrideAttrs (drv: rec {
                  version = "2024-12-09";
                  name = "${drv.pname}-${version}";

                  src = pkgs.fetchFromGitHub {
                    owner = "rust-lang";
                    repo = "rust-analyzer";
                    rev = version;
                    hash =
                      "sha256-I1uc97f/cNhOpCemIbBAUS+CV0R7jts0NW9lc8jrpxc=";
                  };
                  cargoDeps = drv.cargoDeps.overrideAttrs {
                    inherit src;
                    name = "${name}-vendor.tar.gz";
                    outputHash =
                      "sha256-8hqUopbagXlZcIf8wcibMT1zHZrVuStm3lMGAWlMTY4=";
                  };
                });
            })
          ];
        };
        config = import ./config { inherit pkgs neovim-overlay; };
        nixvim' = nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = config;
        };
      in { packages.default = nvim; });
}
