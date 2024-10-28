# https://github.com/idiig/nixvim/blob/16e680494c34247a19d422fcc4dac59112e5d9a2/config/plugins/cjk/skkeleton.nix
{ pkgs, lib, ... }: {
  extraPackages = [ pkgs.deno ];
  extraPlugins = [
    pkgs.vimPlugins.denops-vim
    (pkgs.vimUtils.buildVimPlugin {
      pname = "skkeleton";
      version = "2024-10-14";
      src = pkgs.fetchFromGitHub {
        owner = "vim-skk";
        repo = "skkeleton";
        rev = "2cdd414c1bfa8c363505b8dfc9f50ef2f446ea61";
        hash = "sha256-7oTJGGkUb3K8nzcPqlJrm316ECmgswy/+N8cTQghv3k=";
      };
      meta = {
        description =
          "skkeleton is a Vim/Neovim plugin that provides japanese input environment called SKK.";
        homepage = "https://github.com/vim-skk/skkeleton";
        license = lib.licenses.zlib;
      };
    })
  ];

  keymaps = [
    {
      mode = "i";
      key = "<C-j>";
      action = "<Plug>(skkeleton-toggle)";
      options = {
        desc = "Toggle skkeleton";
        noremap = true;
      };
    }
    {
      mode = "c";
      key = "<C-j>";
      action = "<Plug>(skkeleton-toggle)";
      options = {
        desc = "Toggle skkeleton";
        noremap = true;
      };
    }
  ];

  extraConfigLua = ''
    vim.fn['skkeleton#config']({
      globalDictionaries = {'${pkgs.skkDictionaries.l}/share/skk/SKK-JISYO.L'},
      globalKanaTableFiles = {'${toString ./.}/azik_us.rule'},
      immediatelyOkuriConvert = false,
      lowercaseMap = {['+'] = ';'},
    })
  '';
}
