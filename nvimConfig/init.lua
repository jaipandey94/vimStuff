require("plugins")
require("comment-config")
require("nvim-treesitter-config")
require("nvim-treesitter.install").compilers = { "clang" }
require("undotree-config")
require("harpoon-config")
require("obsidian-config")
require("glow").setup()
require("mason").setup()
vim.g.mapleader = " "
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
require("lsp-config")
vim.wo.relativenumber = true
vim.wo.conceallevel = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- vim.cmd("filetype indent plugin off")

-- File navigation
vim.cmd.nnoremap("<C-d>", "<C-d>zz")
vim.cmd.nnoremap("<C-u>", "<C-u>zz")
vim.cmd.nnoremap("<C-z>", "u")
vim.cmd.nnoremap("q", "<Nop>")
vim.cmd.colorscheme("onedark")
vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})
vim.keymap.set("n", "u", "<Nop>")
vim.keymap.set("n", "G", "<Nop>")
vim.keymap.set("n", "gg", "<Nop>")
vim.keymap.set("n", "<C-y>", "<C-r>")
vim.keymap.set("n", " ", "<Nop>")
vim.keymap.set("n", "H", "h")
vim.keymap.set("n", "J", "j")
vim.keymap.set("n", "K", "k")
vim.keymap.set("n", "L", "L")
vim.keymap.set("v", "H", "h")
vim.keymap.set("v", "J", "j")
vim.keymap.set("v", "K", "k")
vim.keymap.set("v", "L", "L")

--  Fzf binds
vim.keymap.set("n", "<leader>f", "<CMD>FzfLua files<CR>")
vim.keymap.set("n", "<leader>F", "<CMD>FzfLua live_grep<CR>")
vim.keymap.set("n", "<C-f>", "<CMD>FzfLua lgrep_curbuf<CR>")
vim.keymap.set("n", "<leader>G", "<CMD>FzfLua grep<CR>")
vim.keymap.set("v", "<leader>F", "<CMD>FzfLua grep_visual<CR>")
vim.keymap.set("n", "<leader>R", "<CMD>FzfLua resume<CR>")
vim.keymap.set("v", "<C-f>", "<CMD>FzfLua lgrep_curbuf<CR>")

-- Writing and Quitting
vim.keymap.set("n", "<leader>ww", "<CMD>wa<CR>")
vim.keymap.set("n", "<leader>wf", "<CMD>wa!<CR>")
vim.keymap.set("n", "<leader>wq", "<CMD>waq!<CR>")
vim.keymap.set("n", "<leader>qq", "<CMD>q<CR>")
vim.keymap.set("n", "<leader>qf", "<CMD>q!<CR>")
vim.keymap.set("n", "<leader>so", "<CMD>so<CR>")

-- Marks
vim.keymap.set("n", "<M-h>", "'h")
vim.keymap.set("n", "<M-j>", "'j")
vim.keymap.set("n", "<M-k>", "'k")
vim.keymap.set("n", "<M-l>", "'l")

vim.keymap.set("n", "<M-H>", "<CMD>delmarks h<CR>")
vim.keymap.set("n", "<M-J>", "<CMD>delmarks j<CR>")
vim.keymap.set("n", "<M-K>", "<CMD>delmarks k<CR>")
vim.keymap.set("n", "<M-L>", "<CMD>delmarks l<CR>")

-- Copy/Paste registers
vim.keymap.set("v", "y", "\"+y")
vim.keymap.set("v", "yy", "\"+yy")
vim.keymap.set("v", "Y", "\"+y$")
vim.keymap.set("v", "dd", "\"+dd")
vim.keymap.set("v", "D", "\"+D")
vim.keymap.set("v", "x", "\"+x")

-- Code Formatting
vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
vim.opt.expandtab = true
vim.opt["listchars"] = "eol:$,tab:>-,trail:~,extends:>,precedes:<"
vim.opt.list = true

-- Obsidian Binds
vim.keymap.set("n", "<leader>of", "<CMD>ObsidianSearch<CR>")
vim.keymap.set("n", "<leader>ot", "<CMD>ObsidianToday<CR>")
vim.keymap.set("n", "<leader>oy", "<CMD>ObsidianYesterday<CR>")

-- Ease of life rebinds
vim.cmd([[
        cnoreabbrev E Explore
        cnoreabbrev e Explore
        cnoreabbrev W1 w!
        cnoreabbrev w1 w!
        cnoreabbrev Q! q!
        cnoreabbrev Q1 q!
        cnoreabbrev q1 q!
        cnoreabbrev Qa! qa!
        cnoreabbrev Qall! qall!
        cnoreabbrev Wa wa
        cnoreabbrev Wq wq
        cnoreabbrev wQ wq
        cnoreabbrev WQ wq
        cnoreabbrev wq1 wq!
        cnoreabbrev Wq1 wq!
        cnoreabbrev wQ1 wq!
        cnoreabbrev WQ1 wq!
        cnoreabbrev W w
        cnoreabbrev Q q
        cnoreabbrev Qa qa
        cnoreabbrev Qall qall
        ]])


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
