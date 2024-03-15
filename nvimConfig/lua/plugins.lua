local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself	
	--nvim-web-devicons
	-- whichkey
	use("folke/which-key.nvim")
	use("nvim-lua/plenary.nvim") -- Lua functions that Telescope plugin use
	-- use("nvim-telescope/telescope.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use({
	  "nvim-treesitter/nvim-treesitter-textobjects",
	  after = "nvim-treesitter",
	  requires = "nvim-treesitter/nvim-treesitter",
	})
	use("ibhagwan/fzf-lua")
	use("ThePrimeagen/harpoon", {branch = "harpoon2"})
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
	    --- Uncomment the two plugins below if you want to manage the language servers from neovim
	    {'williamboman/mason.nvim'},
	    {'williamboman/mason-lspconfig.nvim'},

	    -- LSP Support
	    {'neovim/nvim-lspconfig'},
	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},
	    {'hrsh7th/cmp-nvim-lsp'},
	    {'L3MON4D3/LuaSnip'},
	  }
	}
	use("williamboman/mason.nvim")
	use ("ranjithshegde/ccls.nvim")
	use("joshdick/onedark.vim")
	use("numToStr/Comment.nvim")
	use {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup {}
		end
	}
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
