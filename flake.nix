{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, nixvim, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (final: prev: {
              deno = prev.deno.overrideAttrs (old: rec {
                version = "2.1.5";
                src = prev.fetchFromGitHub {
                  owner = "denoland";
                  repo = "deno";
                  tag = "v${version}";
                  hash = "sha256-CeRMcMuwER6LnLGAheGS+v4FDw7KADefB3p5ve1HsfE=";
                };
                cargoDeps = old.cargoDeps.overrideAttrs (_: {
                  inherit src;
                  outputHash =
                    "sha256-2R3W0keFz7+xLedCAMniwmx65dBRLMteKQ9fI9Ii83A=";
                });
                doInstallCheck = false;
              });
            })
          ];
        };
        config = import ./config;
        nixvim' = nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = config;
        };
      in { packages.default = nvim; });
}
