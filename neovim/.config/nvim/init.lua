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
  use { 'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'sharkdp/fd',
    }
  }
  use 'mhinz/vim-signify'
  use 'jiangmiao/auto-pairs'
  use 'sainnhe/everforest'
  use 'bhurlow/vim-parinfer'
  use 'hashicorp/sentinel.vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'neovim/nvim-lspconfig'
  use 'github/copilot.vim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }
  use {
    'ur4ltz/surround.nvim',
    config = function()
      require'surround'.setup {
        context_offset = 100,
        load_autogroups = false,
        mappings_style = 'sandwich',
        map_insert_mode = true,
        quotes = {"'", '"'},
        brackets = {'(', '{', '['},
        space_on_closing_char = false,
        prefix = 's',
      }
    end
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
  ignore_install = { "phpdoc", "tree-sitter-phpdoc" },
}

-- lualine
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
local noremap = {noremap = true}
map('n', '<Space>', '', {})
map('i', 'jk', '<esc>', noremap)
map('i', 'kj', '<esc>', noremap)
map('i', '<esc>', '<nop>', {})
map('n', '<Up>', ':wincmd k<CR>', {})
map('n', '<Down>', ':wincmd j<CR>', {})
map('n', '<Left>', ':wincmd h<CR>', {})
map('n', '<Right>', ':wincmd l<CR>', {})
map('n', '<Leader>n', ':bn<CR>', {})
map('n', '<Leader>,', ':vertical resize -10<CR>', {})
map('n', '<Leader>.', ':vertical resize +10<CR>', {})
map('v', '.', ':norm.<CR>', noremap)

-- telescope
map('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', noremap)
map('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', noremap)
map('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', noremap)
map('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>', noremap)


opt.shell = 'fish'
cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
