{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "tiny-code-action-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "rachartier";
        repo = "tiny-code-action.nvim";
        rev = "747a42be79be802bbe882cc22c2a8d00a6e6a2fd";
        hash = "sha256-iOP6zk4v7xZ5nh6+SrWjxZzhOo7D1pJszVp+6Cy1ngs=";
      };
      dependencies = with pkgs.vimPlugins; [
        telescope-nvim
        plenary-nvim
        snacks-nvim
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
