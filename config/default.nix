{ pkgs, ... }:
{
  imports = [
    ./options.nix
    ./telescope.nix
    ./cmp.nix
    ./none-ls.nix
    ./lsp.nix
    ./treesitter.nix
    ./toggleterm.nix
    ./keymaps.nix
    ./which-key.nix
    ./comment.nix
    ./dap.nix
    ./rustaceanvim.nix
    ./vim-translator.nix
    ./skkeleton.nix
    ./cmp-skkeleton.nix
    ./typst.nix
    ./yazi.nix
    ./tiny-code-action.nix
    ./ccc.nix
    ./dropbar.nix
  ];

  colorschemes.one.enable = true;
  highlightOverride.Normal.bg = "none";
  globals.mapleader = " ";
  opts.scrolloff = 3;

  plugins = {
    nvim-autopairs.enable = true;
    auto-save.enable = true;
    barbar.enable = true;
    bufferline.enable = true;
    lightline = {
      enable = true;
      settings.colorscheme = "one";
    };
    wilder = {
      enable = true;
      modes = [
        ":"
        "/"
        "?"
      ];
    };
    noice.enable = true;
    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };
    markdown-preview.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [ mkdir-nvim ];
}
