require("plugins")
require("comment-config")
require("nvim-treesitter-config")
require("nvim-treesitter.install").compilers = { "clang" }
require("undotree-config")
require("keybinds")
require("harpoon-config")
require("obsidian-config")
require("glow").setup()
require("mason").setup()
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
require("lsp-config")
vim.wo.relativenumber = true
vim.wo.conceallevel = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- vim.cmd("filetype indent plugin off")

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
