local dap = require('dap')
local dapui = require('dapui')
-- vim.keymap.set('n', '<C-s>', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', '<C-d>', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<C-s>', ':lua vim.diagnostic.goto_prev()<cr> zz')
--vim.keymap.set('n', 'C-q', vim.diagnostic.setloclist)
vim.keymap.set({ "n", "i" }, '<A-.>', vim.cmd.NvimTreeToggle)

vim.keymap.set('n', '<A-9>', '<C-o>zz')
vim.keymap.set('n', '<A-o>', ':w<cr> :q<cr>')
vim.keymap.set('n', '<A-del>', ':wqa<cr>')
-- vim.keymap.set('n', '<A-o>', ':w<cr> :bw<cr>')
-- vim.keymap.set('n', '<A-.>', ':NvimTreeToggle<cr>')
vim.keymap.set('n', '<A-z>', '')

vim.keymap.set('n', '<S-L>', '<C-w>l')
vim.keymap.set('n', '<S-H>', '<C-w>h')
vim.keymap.set('n', '<S-J>', '<C-w>j')
vim.keymap.set('n', '<S-K>', '<C-w>k')

-- vim.keymap.set('n', '<C-z>', '')
-- vim.keymap.set('n', '<S-f>', '<C-v>')

vim.keymap.set('n', '<A-j>', '<C-d>')
vim.keymap.set('n', '<A-k>', '<C-u>')

vim.keymap.set('n', '<A-z>', ':SplitjoinJoin<cr>')
vim.keymap.set('n', '<A-x>', ':SplitjoinSplit<cr>')
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '<A-;>', ':split<cr> <C-w>j')
vim.keymap.set('n', "<A-'>", ':vsplit<cr> <C"-w>j')
-- KEEP A-s empty until I stop using it on reflex
vim.keymap.set({ 'n', "i" }, "<A-s>", '')


-- vim.keymap.set({ 'n', 'i' }, '<A-s>', '<esc> :w<cr> :!goimports -w % <cr><cr>') -- Source config
vim.keymap.set({ 'n', 'i' }, '<A-e>', '<esc> :w<CR> gE') -- Source config
--
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<A-a>', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<A-d>', ':lua vim.diagnostic.goto_next()<cr> zz')
vim.keymap.set('n', '<A-s>', vim.diagnostic.open_float)

--vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<A-S-y>', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
--
--
vim.keymap.set('n', '<A-[>', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })

vim.keymap.set('n', '<A-->', require('telescope.builtin').lsp_implementations,
	{ desc = '[G]oto [I]mplementation' })

vim.keymap.set('n', '<A-u>', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })

vim.keymap.set('n', '<A-i>', require('telescope.builtin').lsp_dynamic_workspace_symbols,
	{ desc = '[W]orkspace [S]ymbols' })
vim.keymap.set('n', '<A-8>', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })

vim.keymap.set('n', '<A-h>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })

-- vim.keymap.set('n', '<A-]>', require('telescope.builtin').lsp_references, { desc = 'lsp references' })
-- vim.keymap.set('n', '<A-[>', require('telescope.builtin').lsp_implementations, { desc = 'lsp implementation' })
-- vim.g.go_fmt_command = "golines"
-- vim.g.go_fmt_options = { golines = "-m 100" }
--vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })
vim.keymap.set('n', '<A-l>', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes'), {})
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