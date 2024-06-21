-- Packer, manually install it:
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim \
--   ~/.config/nvim/pack/packer/start/packer.nvim
-- OR auto install packer if not installed
-- $PWD/.local/share/nvim/ + ..
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

return require("packer").startup(function()
	use "wbthomason/packer.nvim"

	use "folke/neodev.nvim"

	use { "catppuccin/nvim", as = "catppuccin" }
	use "nvim-lualine/lualine.nvim"
	use {
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	}
	use {
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	}
	use {
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		branch = "0.1.x",
	}
	-- use { "lukas-reineke/indent-blankline.nvim" }
	use { "AndrewRadev/splitjoin.vim" }
	-- use "lewis6991/gitsigns.nvim"
	use 'leoluz/nvim-dap-go'
	use 'mfussenegger/nvim-dap'
	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }

	use "rhysd/vim-clang-format"
	use "fatih/vim-go"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/nvim-cmp"
	use "neovim/nvim-lspconfig"
	use "onsails/lspkind-nvim"
	use "numToStr/Comment.nvim"
	use "windwp/nvim-autopairs"
	use { 'saadparwaiz1/cmp_luasnip' }
	use { "williamboman/mason.nvim" }
	use { "L3MON4D3/LuaSnip", requires = { "rafamadriz/friendly-snippets" } }
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use { "nvim-treesitter/nvim-treesitter-context" }

	if packer_bootstrap then
		require("packer").sync()
	end
end)
