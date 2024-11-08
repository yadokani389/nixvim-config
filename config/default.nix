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
    ./rustaceanvim.nix
    ./vim-translator.nix
    ./markdown-preview.nix
    ./skkeleton.nix
    ./cmp-skkeleton.nix
    ./typst.nix
  ];

  colorschemes.one.enable = true;
  globals.mapleader = " ";
}
