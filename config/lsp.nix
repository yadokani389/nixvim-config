{
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
      diagnostic = {
        "<space>k" = "goto_prev";
        "<space>j" = "goto_next";
      };
      lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "gk" = "hover";
      };
    };
  };
  plugins.rust-tools.enable = true;
}
