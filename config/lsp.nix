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
        nil_ls.enable = true;
        dartls.enable = true;
        denols.enable = true;
        ts_ls.enable = true;
        tinymist.enable = true;
        typos_lsp = {
          enable = true;
          rootDir = "require 'lspconfig.util'.root_pattern('Cargo.toml')";
        };
        volar.enable = true;
        svelte.enable = true;
        jsonls.enable = true;
        taplo.enable = true;
        pyright.enable = true;
        ruff.enable = true;
        hls = {
          enable = true;
          installGhc = true;
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
        rev = "26b070554fce619b870700ea64232bbd80bbc6a7";
        hash = "sha256-cMv9c72xjNNtjGCdf3pGnTWMTRmPgILcYX6RY61PKqk=";
      };
    })
  ];
  extraConfigLua = "require('lsp-endhints').enable()";
}
