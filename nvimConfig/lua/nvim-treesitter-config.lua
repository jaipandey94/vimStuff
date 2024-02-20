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
		init_selection = "gnn", 
		node_incremental = "grn",
		scope_incremental = "grc", 
		node_decremental = "grm", 
		},
	}
}
