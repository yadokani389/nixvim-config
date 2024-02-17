{
  keymaps = [
    # Global Mappings
    # Default mode is "" which means normal-visual-op
    {
      # Toggle NvimTree
      key = "<C-n>";
      action = "<CMD>NvimTreeToggle<CR>";
    }
    {
      # Format file
      key = "<space>fm";
      action = "<CMD>lua vim.lsp.buf.format()<CR>";
    }
    {
      key = ";";
      action = ":";
    }
    {
      mode = "i";
      key = "<C-l>";
      action = "<Right>";
    }
    {
      mode = "i";
      key = "<C-k>";
      action = "<Up>";
    }
    {
      mode = "i";
      key = "<C-j>";
      action = "<Down>";
    }
    {
      mode = "i";
      key = "<C-h>";
      action = "<Left>";
    }
    {
      mode = "i";
      key = "<C-CR>";
      action = "<Esc>o";
    }
    {
      mode = "i";
      key = "<S-CR>";
      action = "<Esc>O";
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "10l";
    }
    {
      mode = "n";
      key = "<S-k>";
      action = "10k";
    }
    {
      mode = "n";
      key = "<S-j>";
      action = "10j";
    }
    {
      mode = "n";
      key = "<S-h>";
      action = "10h";
    }

    # Terminal Mappings
    {
      # Escape terminal mode using ESC
      mode = "t";
      key = "<esc>";
      action = "<C-\\><C-n>";
    }

    # Rust
    {
      # Start standalone rust-analyzer (fixes issues when opening files from nvim tree)
      mode = "n";
      key = "<leader>rs";
      action = "<CMD>RustStartStandaloneServerForBuffer<CR>";
    }
  ];
}
