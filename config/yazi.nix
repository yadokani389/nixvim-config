{
  plugins.yazi = {
    enable = true;
    settings.floating_window_scaling_factor = 0.95;
  };
  keymaps = [
    {
      key = "<leader>e";
      action = "<CMD>Yazi<CR>";
    }
  ];
}
