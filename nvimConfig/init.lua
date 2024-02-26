require("plugins")
require("whichkey")
require("nvim-treesitter-config")
require("undotree-config")
require("harpoon-config")
require("mason").setup()
require("lsp-config")
vim.wo.relativenumber = true
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.cmd.nnoremap("<C-d>", "<C-d>zz")
vim.cmd.nnoremap("<C-u>", "<C-u>zz")
vim.cmd.nnoremap("<C-z>", "u")

vim.keymap.set("n", "u", "<Nop>")
