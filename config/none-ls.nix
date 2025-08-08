{
  plugins.none-ls = {
    enable = true;
    sources = {
      diagnostics = {
        golangci_lint.enable = true;
        statix.enable = true;
      };
      formatting = {
        markdownlint.enable = true;
        typstyle.enable = true;
      };
    };
  };
}
