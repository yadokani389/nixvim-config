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
      key = "<S-l>";
      action = "10l";
    }
    {
      key = "<S-k>";
      action = "10k";
    }
    {
      key = "<S-j>";
      action = "10j";
    }
    {
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

    # Tab
    {
      key = "<M-S-l>";
      action = "<CMD>BufferMoveNext<CR>";
    }
    {
      key = "<M-S-h>";
      action = "<CMD>BufferMovePrevious<CR>";
    }
    {
      key = "<M-p>";
      action = "<CMD>BufferPin<CR>";
    }
    {
      key = "<M-l>";
      action = "<cmd>BufferNext<cR>";
    }
    {
      key = "<M-h>";
      action = "<cmd>BufferPrevious<CR>";
    }
    {
      key = "<M-x>";
      action = "<CMD>BufferClose<CR>";
    }
  ];
}
