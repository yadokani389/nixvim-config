{ pkgs, ... }: {
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        clangd = {
          enable = true;
          onAttach.function = ''
            require("clangd_extensions.inlay_hints").setup_autocmd()
            require("clangd_extensions.inlay_hints").set_inlay_hints()
          '';
        };
        gopls.enable = true;
        kotlin_language_server.enable = true;
        nixd.enable = true;
        ruff_lsp.enable = true;
        dartls.enable = true;
        tinymist.enable = true;
        typos_lsp = {
          enable = true;
          rootDir = "require 'lspconfig.util'.root_pattern('Cargo.toml')";
        };
      };
      keymaps = {
        diagnostic = {
          "<leader>lj" = "goto_next";
          "<leader>lk" = "goto_prev";
        };
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
    clangd-extensions = {
      enable = true;
      inlayHints.inline = "false";
    };
  };

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "lsp-endhints";
      src = pkgs.fetchFromGitHub {
        owner = "chrisgrieser";
        repo = "nvim-lsp-endhints";
        rev = "master";
        sha256 = "sha256-dCySjZoCxcCkt8D1UVJF9wQheU8vgmDxkI0JeGURpnQ=";
      };
    })
  ];
  extraConfigLua = "require('lsp-endhints').enable()";
}
