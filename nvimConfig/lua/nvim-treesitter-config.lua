-- treesitter-config.lua

local configs = require("nvim-treesitter.configs")
configs.setup {
	-- Add a language of your choice
	ensure_installed = {"c", "cpp", "python", "lua", },
	highlight = {
	enable = true, -- false will disable the whole extension
	additional_vim_regex_highlighting = true,

	},
	indent = { enable = true,}, 
	incremental_selection = {
		enable = true,
		keymaps = {
		init_selection = "<leader><C-f>", 
		node_incremental = "<leader><C-f>",
		scope_incremental = "<leader><C-g>", 
		node_decremental = "<leader><C-d>", 
		},
	}
}
