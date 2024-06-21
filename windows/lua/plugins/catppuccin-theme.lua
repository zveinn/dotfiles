local present, catppuccin = pcall(require, "catppuccin")
if not present then return end


catppuccin.setup {
	flavour = "macchiato",
	term_colors = false,
	background = { -- :h background
		light = "macchiato",
		dark = "macchiato",
	},
	-- dim_inactive = {
	-- 	enabled = true,  -- dims the background color of inactive window
	-- 	shade = "dark",
	-- 	percentage = 0.15, -- percentage of the shade to apply to the inactive window
	-- },
	transparent_background = true,

	no_italic = true,
	no_bold = false,
	styles = {
		comments = { "italic" },
		conditionals = { "bold" },
		loops = {},
		functions = { "bold" },
		keywords = {},
		strings = { "bold" },
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = { "bold" },
	},
	color_overrides = {
		all = {
			base = "#080808",
			-- crust = "#0F0F0F"
		},
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		-- mini = {
		-- 	enabled = true,
		-- 	indentscope_color = "",
		-- },
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
	highlight_overrides = {
		macchiato = function(C)
			return {
				NvimTreeNormal = { bg = C.none },
				CmpBorder = { fg = C.surface2 },
				Pmenu = { bg = C.none },
				NormalFloat = { bg = C.none },
				TelescopeBorder = { link = "FloatBorder" },
			}
		end,
	},
}

vim.cmd.colorscheme "catppuccin"
