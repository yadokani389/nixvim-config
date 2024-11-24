{
  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      settings = {
        indent.enable = true;
        highlight = {
          enable = true;
          # for typst-vim conceal
          disable = [ "typst" ];
        };
      };
    };
    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        keymaps = {
          "af" = "@function.outer";
          "if" = "@function.inner";
        };
      };
    };
    rainbow-delimiters.enable = true;
  };
}
