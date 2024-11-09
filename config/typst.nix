{ pkgs, ... }: {
  plugins.typst-vim = {
    enable = true;
    settings.conceal = 1;
  };
  extraPlugins = [ pkgs.vimPlugins.typst-preview-nvim ];
}
