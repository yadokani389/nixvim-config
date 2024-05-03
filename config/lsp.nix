{ pkgs, options, ... }: {
  plugins.lsp = {
    enable = true;
    servers = {
      bashls.enable = true;
      clangd.enable = true;
      elixirls.enable = true;
      fsautocomplete.enable = true;
      gopls.enable = true;
      kotlin-language-server.enable = true;
      nixd.enable = true;
      ruff-lsp.enable = true;
    };
    keymaps = {
      lspBuf = {
        "<leader>ld" = "definition";
        "<leader>lR" = "references";
        "<leader>lt" = "type_definition";
        "<leader>li" = "implementation";
        "<leader>lh" = "hover";
        "<leader>lr" = "rename";
        "<leader>lf" = "format";
      };
    };
  };
  plugins.rust-tools.enable = true;
}
