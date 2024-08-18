{
  plugins.which-key = {
    enable = true;

    settings.spec = [
      {
        __unkeyed-1 = "<leader>l";
        group = "LSP";
      }
      {
        __unkeyed-1 = "<leader>ld";
        group = "Definition";
      }
      {
        __unkeyed-1 = "<leader>lR";
        group = "References";
      }
      {
        __unkeyed-1 = "<leader>lt";
        group = "Type_definition";
      }
      {
        __unkeyed-1 = "<leader>li";
        group = "Implementation";
      }
      {
        __unkeyed-1 = "<leader>lh";
        group = "Hover";
      }
      {
        __unkeyed-1 = "<leader>lr";
        group = "Rename";
      }
      {
        __unkeyed-1 = "<leader>lf";
        group = "Format file";
      }

      {
        __unkeyed-1 = "<leader>f";
        group = "Find";
      }
      {
        __unkeyed-1 = "<leader>b";
        group = "Buffer";
      }
      {
        __unkeyed-1 = "<leader>e";
        group = "Toggle explorer";
      }
      {
        __unkeyed-1 = "<leader>g";
        group = "Git";
      }
      {
        __unkeyed-1 = "<leader>d";
        group = "debug";
      }
    ];
  };
}
