local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then return end

vim.cmd([[
  nnoremap - :NvimTreeToggle<CR>
]])


vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = false

local function my_on_attach(bufnr)
	local api = require('nvim-tree.api')

	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)
	-- remove a default
	vim.keymap.del('n', 'H', { buffer = bufnr })
	---
end

local HEIGHT_RATIO = 1  -- You can change this
local WIDTH_RATIO = 0.2 -- You can change this too

nvimtree.setup({
	on_attach = my_on_attach,
	disable_netrw = true,
	hijack_netrw = true,
	respect_buf_cwd = true,
	sync_root_with_cwd = true,
	diagnostics = {
		enable = true,
	},
	git = {
		enable = true,
		ignore = false,
	},
	renderer = {
		group_empty = false,
		full_name = true,
		indent_width = 1,
		special_files = { "go.mod", ".git", ".gitignore" },
		highlight_git = true,
		highlight_modified = "icon",
		icons = {
			padding = "|",
		}
	},
	filters = {
		dotfiles = false,
	},
	view = {
		side = "right",
		signcolumn = "no",
		float = {
			enable = false,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2)
						- vim.opt.cmdheight:get()
				return {
					relative = "editor",
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		},
		width = function()
			return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		end,
	},
	-- filters = {
	--   custom = { "^.git$" },
	-- },
	-- renderer = {
	--   indent_width = 1,
	-- },
})
