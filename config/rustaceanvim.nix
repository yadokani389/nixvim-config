{ pkgs, ... }:
{
  plugins.rustaceanvim = {
    enable = true;
    settings = {
      server.capabilities.textDocument.completion.completionItem.snippetSupport = false;
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
