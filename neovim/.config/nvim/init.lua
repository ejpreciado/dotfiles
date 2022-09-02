-- functions
local fn = vim.fn
local nvim_set_keymap = vim.api.nvim_set_keymap
local opt = vim.opt
local nvim_command = vim.api.nvim_command

-- packer bootstrap
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    })
end

-- packer
require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lualine/lualine.nvim"
    use "dense-analysis/ale"
    use {"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}}
    use "mhinz/vim-signify"
    use "jiangmiao/auto-pairs"
    use "sainnhe/everforest"
    use "bhurlow/vim-parinfer"
    use "hashicorp/sentinel.vim"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "lukas-reineke/indent-blankline.nvim"
    use "neovim/nvim-lspconfig"
    use "kyazdani42/nvim-tree.lua"
    use "ur4ltz/surround.nvim"
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    use {"akinsho/bufferline.nvim", tag = "v2.*"}
    use "kyazdani42/nvim-web-devicons"
    if packer_bootstrap then require("packer").sync() end
end)

-- treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {enable = true},
    incremental_selection = {enable = true},
    indent = {enable = true},
    ignore_install = {"phpdoc", "tree-sitter-phpdoc"}
})

-- nvim-tree
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {list = {{key = "u", action = "dir_up"}}}
    },
    renderer = {group_empty = true},
    filters = {custom = {"^.git$"}}
})

-- lualine
require("lualine").setup()

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

-- surround
require("surround").setup({
    context_offset = 100,
    load_autogroups = false,
    mappings_style = "sandwich",
    map_insert_mode = true,
    quotes = {"'", '"'},
    brackets = {"(", "{", "["},
    space_on_closing_char = false,
    prefix = "s"
})

-- bufferline
require("bufferline").setup({})

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

-- telescope
nvim_set_keymap("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", noremap)
nvim_set_keymap("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", noremap)
nvim_set_keymap("n", "<Leader>fb", "<cmd>Telescope buffers<cr>", noremap)
nvim_set_keymap("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>", noremap)
nvim_set_keymap("n", "<Leader>fc", "<cmd>Telescope git_commits<cr>", noremap)

-- nvim-tree
nvim_set_keymap("n", "<Leader>/", "<cmd>NvimTreeFindFile<cr>", noremap)
