local setup, gitsigns = pcall(require, "gitsigns")
if not setup then return end


gitsigns.setup {
	signs                        = {
		add          = { text = 'A', show_count = true },
		change       = { text = 'M', show_count = true },
		delete       = { text = 'D', show_count = true },
		topdelete    = { text = 'TD', show_count = true },
		changedelete = { text = 'CD', show_count = true },
		untracked    = { text = 'U', show_count = true },
	},
	signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl                        = true, -- Toggle with `:Gitsigns toggle_numhl`
	linehl                       = true, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir                 = {
		follow_files = true
	},
	attach_to_untracked          = true,
	current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts      = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 500,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
	sign_priority                = 6,
	update_debounce              = 100,
	status_formatter             = nil,  -- Use default
	max_file_length              = 40000, -- Disable if file is longer than this (in lines)
	preview_config               = {
		-- Options passed to nvim_open_win
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
	},
	yadm                         = {
		enable = false
	},
}
