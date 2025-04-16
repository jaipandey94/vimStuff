vim.cmd.nnoremap("<C-d>", "<C-d>zz")
vim.cmd.nnoremap("<C-u>", "<C-u>zz")
vim.cmd.nnoremap("<C-z>", "u")
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
if vim.g.vscode then
    local vscode = require('vscode')
    vim.g.mapleader = " "
    vim.keymap.set("n", "<leader>f", function() vscode.action("workbench.action.quickOpen") end)
    vim.keymap.set("n", "<leader>F", function() vscode.action("workbench.action.findInFiles") end)
    vim.keymap.set("v", "<leader>F",
        function()
            local selected_text = vim.fn.getreg("v")
            vscode.action("workbench.action.findInFiles", { args = { query = selected_text } })
        end)
else
    require("plugins")
    require("whichkey")
    require("comment-config")
    require("nvim-treesitter-config")
    require("nvim-treesitter.install").compilers = { "clang" }
    require("undotree-config")
    require("harpoon-config")
    require("glow").setup()
    require("mason").setup()
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    require("lsp-config")
    vim.wo.relativenumber = true
    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("onedark")
    vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})
    vim.keymap.set("n", "u", "<Nop>")
    vim.keymap.set("n", "<C-y>", "<C-r>")
    vim.keymap.set("n", " ", "<Nop>")
    vim.keymap.set("n", "<leader>f", "<CMD>FzfLua files<CR>")
    vim.keymap.set("n", "<leader>F", "<CMD>FzfLua live_grep<CR>")
    vim.keymap.set("n", "<C-f>", "<CMD>FzfLua lgrep_curbuf<CR>")
    vim.keymap.set("n", "<leader>G", "<CMD>FzfLua grep<CR>")
    vim.keymap.set("v", "<leader>F", "<CMD>FzfLua grep_visual<CR>")
end
