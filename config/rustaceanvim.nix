{ pkgs, ... }:
{
  plugins.rustaceanvim = {
    enable = true;
    settings.dap = {
      autoloadConfigurations = true;
      adapter = {
        command = "${pkgs.lldb_19}/bin/lldb-dap";
        type = "executable";
      };
    };
  };
}
