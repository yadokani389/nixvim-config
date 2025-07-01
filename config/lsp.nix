{ lib, pkgs, ... }:
{
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
        nil_ls = {
          enable = true;
          settings = {
            formatting.command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
            nix.flake.autoArchive = true;
          };
        };
        dartls.enable = true;
        denols.enable = true;
        ts_ls.enable = true;
        tinymist.enable = true;
        typos_lsp = {
          enable = true;
          rootMarkers = [ "Cargo.toml" ];
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
        wgsl_analyzer.enable = true;
        html.enable = true;
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
      settings.inlay_hints.inline = false;
    };
  };

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "lsp-endhints";
      src = pkgs.fetchFromGitHub {
        owner = "chrisgrieser";
        repo = "nvim-lsp-endhints";
        rev = "f9e5ffa17dd1161ea2dda265c1702df78432dad7";
        hash = "sha256-TXtNf6l+WIT0A0/SgL69DmA9EqQfmLtc4echMUopgWk=";
      };
    })
  ];
  extraConfigLua = "require('lsp-endhints').enable()";
}
