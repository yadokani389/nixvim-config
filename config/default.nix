{
  imports = [
    ./autosave.nix
    ./auto-pairs.nix
    ./options.nix
    ./bufferline.nix
    ./telescope.nix
    ./nvim-tree.nix
    ./lightline.nix
    ./git.nix
    ./cmp.nix
    ./none-ls.nix
    ./wilder.nix
    ./lsp.nix
    ./treesitter.nix
    ./toggleterm.nix
    ./keymaps.nix
    ./barbar.nix
    ./which-key.nix
    ./diffview.nix
    ./comment.nix
    ./dap.nix
    ./dropbar.nix
    ./noice.nix
  ];

  colorschemes.one.enable = true;
  globals.mapleader = " ";
}
