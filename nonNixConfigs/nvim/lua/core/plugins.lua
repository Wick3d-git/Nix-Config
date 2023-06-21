local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'wbthomason/packer.nvim',
  'ellisonleao/gruvbox.nvim',
  {
    'dracula/vim',
    lazy = false,
  },
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'navarasu/onedark.nvim',
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
  'bluz71/vim-nightfly-colors',
  'vim-test/vim-test',
  'lewis6991/gitsigns.nvim',
  'preservim/vimux',
  'christoomey/vim-tmux-navigator',
  'tpope/vim-fugitive',
  'rmehri01/onenord.nvim',
  'AlexvZyl/nordic.nvim',
  'olivercederborg/poimandres.nvim',
  'AhmedAbdulrahman/vim-aylin',
  'voidekh/kyotonight.vim',
  'lewpoly/sherbet.nvim',
  'gbprod/nord.nvim',
  'goolord/alpha-nvim',
  'ms-jpq/coq_nvim',
  'brenoprata10/nvim-highlight-colors',
  -- completion
  'hrsh7th/nvim-cmp',
  "lukas-reineke/indent-blankline.nvim", branch = 'lua',
  'hrsh7th/cmp-nvim-lsp',
  'vim-scripts/AutoComplPop',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/vim-vsnip',
  'L3MON4D3/LuaSnip',
  'SirVer/ultisnips',
  'quangnguyen30192/cmp-nvim-ultisnips',
  'dcampos/nvim-snippy',
  'dcampos/cmp-snippy',  
  'saadparwaiz1/cmp_luasnip',
  "rafamadriz/friendly-snippets",
  "github/copilot.vim",
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  "glepnir/lspsaga.nvim",
  {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.0',
    hidden=true,
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
