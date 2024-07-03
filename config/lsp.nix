{ pkgs, options, ... }: {
  plugins = {
    lsp = {
      enable = true;
      servers = {
        clangd = {
          enable = true;
          onAttach.function = ''
            require("clangd_extensions.inlay_hints").setup_autocmd()
            require("clangd_extensions.inlay_hints").set_inlay_hints()
          '';
        };
        gopls.enable = true;
        kotlin-language-server.enable = true;
        nixd.enable = true;
        ruff-lsp.enable = true;
        dartls.enable = true;
        typst-lsp.enable = true;
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
    clangd-extensions.enable = true;
    rust-tools.enable = true;
  };
}
