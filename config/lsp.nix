{ pkgs, options, ... }: {
  plugins.lsp = {
    enable = true;
    servers = {
      bashls.enable = true;
      clangd = {
        enable = true;
        cmd = [
          "${options.plugins.lsp.servers.clangd.package.default}/bin/clangd"
          "--header-insertion=iwyu"
          "--background-index"
          "--clang-tidy"
          "--all-scopes-completion"
          "--completion-style=detailed"
          "--function-arg-placeholders"
          "--fallback-style=google"
        ];
      };
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
