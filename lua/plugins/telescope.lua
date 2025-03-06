local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then return end

telescope.setup {
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
}

telescope.load_extension("fzf")
