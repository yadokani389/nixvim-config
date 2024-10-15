# https://zenn.dev/mozumasu/articles/mozumasu-translate-in-vim
{ pkgs, ... }: {
  extraPackages = [ pkgs.python3 ];
  extraPlugins = [{
    plugin = pkgs.vimUtils.buildVimPlugin {
      name = "vim-translator";
      src = pkgs.fetchFromGitHub {
        owner = "voldikss";
        repo = "vim-translator";
        rev = "master";
        sha256 = "sha256-ow5axYMtH433hXwYF5Oz3wWT/24VUHpALrH+Phlwk90=";
      };
    };
    config = ''
      lua << EOF
        vim.g.translator_target_lang = "ja"
        vim.g.translator_default_engines = { "google" }
        vim.g.translator_window_type = "popup"
        vim.g.translator_window_max_width = 0.5
        vim.g.translator_window_max_height = 0.9
      EOF
    '';
  }];

  keymaps = [
    {
      key = "<leader>t";
      options = { desc = "Translate"; };
      action = "";
    }
    {
      mode = "n";
      key = "<leader>tj";
      action = "<CMD>TranslateW<CR>";
      options = { desc = "Translate words into Japanese"; };
    }
    {
      mode = "v";
      key = "<leader>tj";
      action = ":'<,'>TranslateW<CR>";
      options = { desc = "Translate lines into Japanese"; };
    }
    {
      mode = "n";
      key = "<leader>te";
      action = "<CMD>TranslateW --target_lang=en<CR>";
      options = { desc = "Translate words into English"; };
    }
    {
      mode = "v";
      key = "<leader>te";
      action = ":'<,'>TranslateW --target_lang=en<CR>";
      options = { desc = "Translate lines into English"; };
    }
    {
      key = "<leader>tr";
      options = { desc = "Translate Replace"; };
      action = "";
    }
    {
      mode = "n";
      key = "<leader>trj";
      action.__raw = ''
        function()
          vim.api.nvim_feedkeys("^vg_", "n", false)
          -- Execute the conversion command after a short delay.
          vim.defer_fn(function()
            vim.api.nvim_feedkeys(":TranslateR\n", "n", false)
          end, 100) -- 100ms delay
        end'';
      options = { desc = "Replace to Japanese"; };
    }
    {
      mode = "v";
      key = "<leader>trj";
      action = ":'<,'>TranslateR<CR>";
      options = { desc = "Replace to Japanese"; };
    }
    {
      mode = "n";
      key = "<leader>tre";
      action.__raw = ''
        function()
          vim.api.nvim_feedkeys("^vg_", "n", false)
          -- Execute the conversion command after a short delay.
          vim.defer_fn(function()
            vim.api.nvim_feedkeys(":TranslateR --target_lang=en\n", "n", false)
          end, 100) -- 100ms delay
        end'';
      options = { desc = "Replace to English"; };
    }
    {
      mode = "v";
      key = "<leader>tre";
      action = ":'<,'>TranslateR --target_lang=en<CR>";
      options = { desc = "Replace to English"; };
    }
  ];
}
