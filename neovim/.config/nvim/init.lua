-- functions
local fn = vim.fn
local nvim_set_keymap = vim.api.nvim_set_keymap
local opt = vim.opt

-- packer bootstrap
local ensure_packer = function()
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- packer
require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-tree/nvim-web-devicons"
  use "nvim-lualine/lualine.nvim"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  use "lewis6991/gitsigns.nvim"
  use "sainnhe/everforest"
  use 'jiangmiao/auto-pairs'
  use "lukas-reineke/indent-blankline.nvim"
  use {"nvim-tree/nvim-tree.lua", requires = {"nvim-tree/nvim-web-devicons"}}
  use {"romgrk/barbar.nvim", requires = {"nvim-tree/nvim-web-devicons"}}
  use {"kylechui/nvim-surround", tag = "*"}
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
  use {"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}}
  if packer_bootstrap then require("packer").sync() end
end)

-- lualine
require("lualine").setup()

-- mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- mason-lspconfig
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "ruby_ls" }
})

-- lsp 
require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({})
  end,
  ["sumneko_lua"] = function ()
    require("lspconfig").sumneko_lua.setup({
      settings={Lua={diagnostics={globals={"vim"}}}}
    })
  end
})

-- lsp lines
require("lsp_lines").setup()

-- gitsigns
require("gitsigns").setup()

vim.o.sessionoptions =
    "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- nvim-tree
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {list = {{key = "u", action = "dir_up"}}}
    },
    filters = {custom = {"^.git$"}},
    live_filter = {always_show_folders = true},
    renderer = {group_empty = true, highlight_opened_files = "all"},
    update_focused_file = {enable = true}
})

-- barbar
require("bufferline").setup()

-- indent-blankline
require("indent_blankline").setup({
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true
})

-- surround
require("nvim-surround").setup()

-- treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {enable = true},
    incremental_selection = {enable = true},
    indent = {enable = true},
    ignore_install = {"phpdoc", "tree-sitter-phpdoc"}
})

-- telescope
require("telescope").setup {
    defaults = {
        mappings = {i = {["<esc>"] = require("telescope.actions").close}}
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}

require("telescope").load_extension("fzf")

-- display
vim.cmd("colorscheme everforest")
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.ignorecase = true
opt.expandtab = true
opt.softtabstop = 2
opt.shiftwidth = 2
opt.termguicolors = true
opt.colorcolumn = "100"
opt.updatetime = 100
opt.background = "dark"
opt.clipboard = "unnamed"
vim.diagnostic.config { virtual_text = false }

-- mappings
vim.g.mapleader = " "
vim.g.maplocalleader = ","
local noremap = {noremap = true}
nvim_set_keymap("n", "<Space>", "", {})
nvim_set_keymap("i", "jk", "<esc>", noremap)
nvim_set_keymap("i", "kj", "<esc>", noremap)
nvim_set_keymap("i", "<esc>", "<nop>", {})
nvim_set_keymap("n", "<Up>", ":wincmd k<CR>", {})
nvim_set_keymap("n", "<Down>", ":wincmd j<CR>", {})
nvim_set_keymap("n", "<Left>", ":wincmd h<CR>", {})
nvim_set_keymap("n", "<Right>", ":wincmd l<CR>", {})
nvim_set_keymap("n", "<Leader>n", ":bn<CR>", {})
nvim_set_keymap("n", "<Leader>p", ":bp<CR>", {})
nvim_set_keymap("n", "<Leader>w", ":bd<CR>", {})
nvim_set_keymap("n", "<Leader>,", ":vertical resize -10<CR>", {})
nvim_set_keymap("n", "<Leader>.", ":vertical resize +10<CR>", {})
nvim_set_keymap("v", ".", ":norm.<CR>", noremap)

-- nvim-tree
nvim_set_keymap("n", "<Leader>/", "<cmd>NvimTreeToggle<cr>", noremap)

-- telescope
nvim_set_keymap("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", noremap)
nvim_set_keymap("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", noremap)
nvim_set_keymap("n", "<Leader>fb", "<cmd>Telescope buffers<cr>", noremap)
nvim_set_keymap("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>", noremap)
nvim_set_keymap("n", "<Leader>fc", "<cmd>Telescope git_commits<cr>", noremap)
