# NixVim Configuration

## How to run

To run the configuration you can type the following:

```bash
nix run github:mikaelfangel/nixvim-config
```

## How to include as pacakge

To include the configuration as a replacement for neovim you first need to ad it as an input on your system
```
inputs.nixvim.url = "github:mikaelfangel/nixvim-config"
```

Then you can input this in you configuration.nix (be sure that you inherit inputs from your flake)
```
  environment = {
    systemPackages = with pkgs; [
      inputs.nixvim.packages."x86_64-linux".default
    ];
  };
```

## Contributing

If there is something that you feel that is not quite right or you have ideas for improvment please submit a issue or a PR.

## Acknowledgements
 * [NixVim](https://github.com/nix-community/nixvim)
