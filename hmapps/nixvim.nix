{ self, pkgs, ... }: {
  imports = [
    ./bufferline.nix
    ./lsp.nix
    ./copilot.nix
    ./cmp.nix
    #./colorscheme.nix
    ./luasnip.nix
    ./git.nix
    ./cursorline.nix
    ./markdown.nix
  ];
  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    colorschemes.nord.enable = true;
    plugins = {
      lualine.enable = true;
      luasnip.enable = true;
      cmp_luasnip.enable = true;
      nvim-tree.enable = true;
      treesitter.enable = true;
      treesitter.ensureInstalled = [
        "bash"
        "cpp"
        "css"
        "go"
        "html"
        "java"
        "json"
        "latex"
        "lua"
        "make"
        "nix"
        "python"
        "regex"
        "rust"
        "yaml"
      ];
      telescope.enable = true;
      gitsigns.enable = true;
      indent-blankline.enable = true;
      fidget.enable = true;
    };
    options = {
      number = true; # Show line numbers
      shiftwidth = 2; # Tab width should be 2
      tabstop = 2;
      expandtab = true;
      smarttab = true;
      autoindent = true;
      cindent = true;
      linebreak = true;
      hidden = true;
    };
    keymaps = [
      {
        action = "<cmd> Telescope find_files hidden=true<CR>";
        mode = "n";
        key = "<leader>pf";
      }
      {
        action = "<cmd> Telescope git_files hidden=true<CR>";
        mode = "n";
        key = "<C-p>";
      }
      {
        action = "<cmd> NvimTreeFindFileToggle<CR>";
        mode = "n";
        key = "<C-n>";
      }
    ];
    extraConfigLua = ''
          require'lspconfig'.html.setup{
            filetypes = { "html", "heex" }
          }
        -- Set up lspconfig.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require'lspconfig'.html.setup {
        capabilities = capabilities
      }
    '';

  };
}
