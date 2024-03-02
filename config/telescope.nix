{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<space>fg" = "live_grep";
      "<C-p>" = {
        action = "git_files";
        desc = "Telescope Git Files";
      };
    };
    extensions.fzf-native = { enable = true; };
  };
}
