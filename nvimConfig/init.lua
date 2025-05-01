require("plugins")
require("whichkey")
require("comment-config")
require("nvim-treesitter-config")
require("nvim-treesitter.install").compilers = { "clang" }
require("undotree-config")
require("harpoon-config")
require("glow").setup()
require("mason").setup()
vim.g.mapleader = " "
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
require("lsp-config")
vim.wo.relativenumber = true
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- vim.cmd("filetype indent plugin off")
vim.cmd.nnoremap("<C-d>", "<C-d>zz")
vim.cmd.nnoremap("<C-u>", "<C-u>zz")
vim.cmd.nnoremap("<C-z>", "u")
vim.cmd.colorscheme("onedark")
vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})
vim.keymap.set("n", "u", "<Nop>")
vim.keymap.set("n", "G", "<Nop>")
vim.keymap.set("n", "gg", "<Nop>")
vim.keymap.set("n", "<C-y>", "<C-r>")
vim.keymap.set("n", " ", "<Nop>")
vim.keymap.set("n", "<leader>f", "<CMD>FzfLua files<CR>")
vim.keymap.set("n", "<leader>F", "<CMD>FzfLua live_grep<CR>")
vim.keymap.set("n", "<C-f>", "<CMD>FzfLua lgrep_curbuf<CR>")
vim.keymap.set("n", "<leader>G", "<CMD>FzfLua grep<CR>")
vim.keymap.set("v", "<leader>F", "<CMD>FzfLua grep_visual<CR>")
vim.keymap.set("n", "<leader>R", "<CMD>FzfLua resume<CR>")
vim.keymap.set("v", "<C-f>", "<CMD>FzfLua lgrep_curbuf<CR>")
vim.keymap.set("v", "y", "\"+y")
vim.keymap.set("v", "yy", "\"+yy")
vim.keymap.set("v", "Y", "\"+y$")
vim.keymap.set("v", "dd", "\"+dd")
vim.keymap.set("v", "D", "\"+D")
vim.keymap.set("v", "x", "\"+x")
vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
vim.opt.expandtab = true
vim.opt["listchars"] = "eol:$,tab:>-,trail:~,extends:>,precedes:<"
vim.opt.list = true

-- Check if PowerShell executable is available
local pwsh_executable = vim.fn.executable 'pwsh' == 1
local shell = pwsh_executable and 'pwsh' or 'powershell'

-- Set shell options
vim.opt.shell = shell
vim.opt.shellcmdflag =
"-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
vim.opt.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
vim.opt.shellpipe = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
vim.opt.shellquote = ''
vim.opt.shellxquote = ''
