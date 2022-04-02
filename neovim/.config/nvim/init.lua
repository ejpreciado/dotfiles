local fn = vim.fn
local map = vim.api.nvim_set_keymap
local opt = vim.opt
local cmd = vim.api.nvim_command

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'dense-analysis/ale'
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'mhinz/vim-signify'
  use 'jiangmiao/auto-pairs'
  use 'sainnhe/everforest'
  use 'bhurlow/vim-parinfer'
  use 'hashicorp/sentinel.vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'github/copilot.vim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }
  use {
    "ur4ltz/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "sandwich"}
    end
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true }
}

require'lualine'.setup()

vim.cmd 'colorscheme everforest'
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.ignorecase = true
opt.expandtab = true
opt.softtabstop = 2
opt.shiftwidth = 2
opt.termguicolors = true
opt.colorcolumn = '100'
opt.updatetime = 100
opt.background = 'dark'
opt.clipboard = 'unnamed'

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
map('n', '<Space>', '', {})
map('i', 'jk', '<esc>', {noremap = true})
map('i', 'kj', '<esc>', {noremap = true})
map('i', '<esc>', '<nop>', {})
map('n', '<Up>', ':wincmd k<CR>', {})
map('n', '<Down>', ':wincmd j<CR>', {})
map('n', '<Left>', ':wincmd h<CR>', {})
map('n', '<Right>', ':wincmd l<CR>', {})
map('n', '<Leader>n', ':bn<CR>', {})
map('n', '<Leader>,', ':vertical resize -10<CR>', {})
map('n', '<Leader>.', ':vertical resize +10<CR>', {})
map('v', '.', ':norm.<CR>', {noremap = true})

opt.shell = 'fish'
cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
