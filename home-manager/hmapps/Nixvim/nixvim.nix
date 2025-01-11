{
  imports = [
    ./keys.nix
    ./sets.nix
    ./plugins/bufferline.nix
    ./plugins/cmp.nix
    ./plugins/conform.nix
    ./plugins/copilot.nix
    ./plugins/cursorline.nix
    ./plugins/git.nix
    ./plugins/harpoon.nix
    ./plugins/lint.nix
    ./plugins/lsp.nix
    ./plugins/lualine.nix
    ./plugins/luasnip.nix
    ./plugins/neo-tree.nix
    ./plugins/noice.nix
    ./plugins/none-ls.nix
    ./plugins/telescope.nix
    ./plugins/treesiter.nix
    ./plugins/undotree.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes = {
      nord.enable = true;
    };
    plugins = {
      web-devicons.enable = true;
    };
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };
  };
}
