require("plugins")
require("whichkey")
require("nvim-treesitter-config")
require("undotree-config")
require("harpoon-config")
require("mason").setup()
require("lsp-config")
vim.wo.relativenumber = true
-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true
vim.cmd.nnoremap("<C-d>", "<C-d>zz")
vim.cmd.nnoremap("<C-u>", "<C-u>zz")
vim.cmd[[colorscheme material-deep-ocean]]
vim.keymap.set("n", "<C-f>", "/")
vim.cmd [[
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=2
set tabstop=4
]]
