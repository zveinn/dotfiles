local setup, treesitter = pcall(require, "nvim-treesitter.configs")
if not setup then return end

-- vim.opt.foldmethod="expr"
-- vim.opt.foldexpr="nvim_treesitter#foldexpr()"
-- vim.opt.foldenable=false


treesitter.setup {
	ensure_installed = {
		"gitignore",
		"vimdoc",
		"typescript",
		"go",
		"gomod",
		"gowork",
		"tsx",
		"javascript",
		"json",
		"html",
		"css",
		"lua",
		"markdown",
		"proto",
		"yaml",
		"c",
		"lua",
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			-- init_selection = "<A-h>",
			-- node_incremental = "<A-l>",
			scope_incremental = false,
			-- node_decremental = "<bs>",
		},
	},
	auto_install = true,
	sync_install = false,
	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 1000 * 1024 -- 1000 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
}
