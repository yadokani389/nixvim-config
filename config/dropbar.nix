{ pkgs, ... }: {
  extraPlugins = [{
    plugin = pkgs.vimPlugins.dropbar-nvim;
    config = ''
      lua require("dropbar").setup()
    '';
  }];
}
