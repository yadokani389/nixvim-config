{ pkgs, ... }:
{
  plugins.rustaceanvim = {
    enable = true;
    settings = {
      server.default_settings.rust-analyzer.completion.postfix.enable = false;
      dap = {
        autoloadConfigurations = true;
        adapter = {
          command = "${pkgs.lldb_19}/bin/lldb-dap";
          type = "executable";
        };
      };
    };
  };
}
