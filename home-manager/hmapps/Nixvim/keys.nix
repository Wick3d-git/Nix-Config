{
  programs.nixvim = {
    keymaps = [
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>cf";
        action = "<cmd>lua vim.lsp.buf.format()<cr>";
        options = {
          silent = true;
          desc = "Format";
        };
      }
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
      {
        action = "<cmd> Telescope find_files hidden=true<CR>";
        mode = "n";
        key = "<leader><space>";
      }
      {
        action = "<cmd> Telescope git_files hidden=true<CR>";
        mode = "n";
        key = "<C-s>";
      }
    ];
  };
}
