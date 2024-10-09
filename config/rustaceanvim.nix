{ pkgs, ... }: {
  plugins.rustaceanvim = {
    enable = true;
    settings = {
      dap = {
        autoloadConfigurations = true;
        adapter = let code-lldb = pkgs.vscode-extensions.vadimcn.vscode-lldb;
        in {
          executable.command =
            "${code-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
          executable.args = [
            "--liblldb"
            "${code-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/lldb/lib/liblldb.dylib"
            "--port"
            "13000"
          ];
          type = "server";
          port = "13000";
        };
      };
    };
  };
}
