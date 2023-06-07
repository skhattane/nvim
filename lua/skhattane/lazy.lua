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

require("lazy").setup({
  ------------------
  -- Theme
  ------------------
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
        vim.cmd.colorscheme 'onedark'
    end,
  },
  ------------------
  -- Tree
  ------------------
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
  },
  ------------------
  -- Lualine
  ------------------
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  ------------------
  -- Fuzzy Finder
  ------------------
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    'nvim-telescope/telescope-fzf-native.nvim', -- NOTE: If you are having trouble with this installation, refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  ------------------
  -- LSP
  ------------------
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} }, -- Useful status updates for LSP / NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      'folke/neodev.nvim', -- Additional lua configuration, makes nvim stuff amazing!
    },
  },
  ------------------
  -- Autocompletion
  ------------------
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip', -- Snippet Engine & its associated nvim-cmp source
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp', -- Add LSP completion capabilities
      'rafamadriz/friendly-snippets', -- Adds a number of user-friendly snippets
    },
  },
  -----------------
  -- Display keybinding
  -----------------
  { 'folke/which-key.nvim', opts = {} }, -- Useful plugin to show you pending keybinds
  -----------------
  -- Highlight, edit and navigate code
  -----------------
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  -----------------
  -- Undotree
  -----------------
  {
    'mbbill/undotree',
  },
  ----------------
  -- Git
  ----------------
  {
    'tpope/vim-fugitive',
  },
})
