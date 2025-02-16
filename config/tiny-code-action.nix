{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "tiny-code-action-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "rachartier";
        repo = "tiny-code-action.nvim";
        rev = "8888f593c04c8acb29b04a71f6187ef6956be0cd";
        hash = "sha256-F76w/V6G2L1TzjNQJGrge/edWfsBzvp39RvlGzEUVnA=";
      };
      dependencies = with pkgs.vimPlugins; [
        telescope-nvim
        plenary-nvim
      ];
    })
  ];

  keymaps = [
    {
      key = "<leader>lc";
      action = "<cmd>lua require('tiny-code-action').code_action()<cr>";
      mode = "n";
      options = {
        silent = true;
        desc = "Open code actions with preview";
      };
    }
  ];

  extraConfigLua = "require('tiny-code-action').setup();";
}
