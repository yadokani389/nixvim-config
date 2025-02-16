{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>gb" = {
        action = "git_branches";
        options.desc = "Git branches";
      };
      "<leader>gc" = {
        action = "git_commits";
        options.desc = "Git commits (repository)";
      };
      "<leader>gC" = {
        action = "git_bcommits";
        options.desc = "Git commits (current file)";
      };
      "<leader>gs" = {
        action = "git_status";
        options.desc = "Git status";
      };

      "<leader>f/" = {
        action = "current_buffer_fuzzy_find";
        options.desc = "Find words in current buffer";
      };
      "<leader>fc" = {
        action = "grep_string";
        options.desc = "Find word under cursor";
      };
      "<leader>fk" = {
        action = "keymaps";
        options.desc = "Find keymaps";
      };
      "<leader>fo" = {
        action = "oldfiles";
        options.desc = "Find history";
      };
      "<leader>fh" = {
        action = "help_tags";
        options.desc = "Find help";
      };
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Find files";
      };
      "<leader>fw" = {
        action = "live_grep";
        options.desc = "Find words";
      };
    };

    extensions.fzf-native.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>fF";
      action = "<cmd>lua require('telescope.builtin').find_files{ hidden = true, no_ignore = true }<cr>";
      options.desc = "Find all files";
    }
    {
      mode = "n";
      key = "<leader>fW";
      action = "<cmd>lua require('telescope.builtin').live_grep{ additional_args = function(args) return vim.list_extend(args, { '--hidden', '--no-ignore' }) end,}<cr>";
      options.desc = "Find words in all files";
    }
  ];
  plugins.web-devicons.enable = true;
}
