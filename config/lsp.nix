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
        rev = "0bd03846561f46d8b7d2284a02d3748c3d35621b";
        hash = "sha256-MgvZqaYbJWmcjIYJM0hCfnIVc+uKE0vk3Ky6PWFYpys=";
      };
    })
  ];
  extraConfigLua = "require('lsp-endhints').enable()";
}
