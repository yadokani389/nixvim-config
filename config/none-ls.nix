{
  plugins.none-ls = {
    enable = true;
    sources = {
      diagnostics = {
        golangci_lint.enable = true;
        ktlint.enable = true;
        statix.enable = true;
      };
      formatting = {
        fantomas.enable = true;
        gofmt.enable = true;
        goimports.enable = true;
        ktlint.enable = true;
        markdownlint.enable = true;
        typstyle.enable = true;
      };
    };
  };
}
