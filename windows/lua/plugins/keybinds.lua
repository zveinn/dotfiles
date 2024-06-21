-- vim.keymap.set('n', '<C-s>', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', '<C-d>', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<C-s>', ':lua vim.diagnostic.goto_prev()<cr> zz')
--vim.keymap.set('n', 'C-q', vim.diagnostic.setloclist)
-- local setup, nvimtree = pcall(require, "nvim-tree-api")


-- vim.keymap.set('n', '<A-.>', ':NvimTreeToggle<cr>')
vim.keymap.set({ "n", "i" }, '<A-.>', vim.cmd.NvimTreeToggle)



vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<A-o>', ':w<cr> :q<cr>')


-- vim.keymap.set('n', '<A-o>', ':w<cr> :bw<cr>')
vim.keymap.set('n', '<A-C-q>', ':source $MYVIMRC<cr>')
vim.keymap.set('n', '<A-z>', '')
vim.keymap.set('n', '<C-z>', '')

vim.keymap.set('n', '<S-L>', '<C-w>l')
vim.keymap.set('n', '<S-H>', '<C-w>h')
vim.keymap.set('n', '<S-J>', '<C-w>j')
vim.keymap.set('n', '<S-K>', '<C-w>k')

vim.keymap.set('n', '<S-f>', '<C-v>')

vim.keymap.set('n', '<A-j>', '<C-d>')
vim.keymap.set('n', '<A-k>', '<C-u>')

vim.keymap.set('n', '<A-z>', ':SplitjoinJoin<cr>')
vim.keymap.set('n', '<A-x>', ':SplitjoinSplit<cr>')
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '<A-;>', ':split<cr> <C-w>j')


-- vim.keymap.set({ 'n', 'i' }, '<A-s>', '<esc> :w<cr> :!goimports -w % <cr><cr>') -- Source config
vim.keymap.set({ 'n', 'i' }, '<A-s>', '<esc> :w<cr>') -- Source config
-- vim.keymap.set({ 'n', 'i' }, '<esc>', '<esc> :w<cr>') -- Source config
--
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<C-a>', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<C-d>', ':lua vim.diagnostic.goto_next()<cr> zz')
vim.keymap.set('n', '<C-s>', vim.diagnostic.open_float)

--vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<A-S-y>', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
--
vim.keymap.set('n', '<A-S-u>', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<A-S-i>', require('telescope.builtin').lsp_dynamic_workspace_symbols,
	{ desc = '[W]orkspace [S]ymbols' })
vim.keymap.set('n', '<A-S-o>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<A-]>', require('telescope.builtin').lsp_references, { desc = '' })
vim.keymap.set('n', '<A-[>', require('telescope.builtin').lsp_implementations, { desc = '' })

-- vim.g.go_fmt_command = "golines"
-- vim.g.go_fmt_options = { golines = "-m 100" }
--vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })
vim.keymap.set('n', '<A-S-p>', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 0,
		previewer = true,
		theme = "dropdown",

		sorting_strategy = "ascending",
		layout_strategy = "center",
		layout_config = {
			preview_cutoff = 0, -- Preview should always show (unless previewer = false)

			width = function(_, max_columns, _)
				return math.min(max_columns, 100)
			end,

			height = function(_, _, max_lines)
				return math.min(max_lines, 15)
			end,
		},

		border = true,
		borderchars = {
			prompt = { "─", "│", " ", "│", "", "", "│", "│" },
			results = { "─", "│", "─", "│", "", "", "", "" },
			preview = { "─", "│", "─", "│", "", "", "", "" },
		},
	})
end, { desc = '[/] Fuzzily search in current buffer' })

-- COMMENT
-- COMMENT
-- COMMENT
local setup, comment = pcall(require, "Comment")
if not setup then return end

comment.setup({
	toggler = {
		line = '<A-/>',
		block = "g",
	},
	opleader = {
		line = "<A-/>",
		block = "g",
	},
})
