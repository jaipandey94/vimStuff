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
vim.keymap.set("n", " ", "<Nop>")
vim.keymap.set("n", "<leader>f", "<CMD>FzfLua files<CR>")
vim.keymap.set("n", "<leader>F", "<CMD>FzfLua live_grep<CR>")
vim.keymap.set("n", "<leader>G", "<CMD>FzfLua grep<CR>")
vim.keymap.set("v", "<leader>F", "<CMD>FzfLua grep_visual<CR>")
