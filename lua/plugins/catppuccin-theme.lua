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
	-- 	percentage = 0.01, -- percentage of the shade to apply to the inactive window
	-- },
	transparent_background = true,

	no_italic = true,
	no_bold = false,
	styles = {
		comments = { "bold" },
		conditionals = { "bold" },
		loops = {},
		functions = { "bold" },
		keywords = {},
		strings = { "bold" },
		variables = {},
		numbers = { "bold" },
		booleans = { "bold" },
		properties = {},
		types = { "bold" },
	},
	color_overrides = {
		all = {
			-- base = "#080808",
			base = "#080808",
			crust = "#080808",
			--	crust = "#080808",
		},
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
	highlight_overrides = {
		macchiato = function(C)
			return {
				NvimTreeNormal = { bg = C.none },
				CmpBorder = { fg = C.none },
				Pmenu = { bg = C.none },
				NormalFloat = { bg = C.none },
				WinSeparator = { bg = C.none, fg = C.none },
				TelescopeBorder = { link = "FloatBorder" },
				CursorLine = { bg = C.none },
				Cursor = { bg = "#FFFFFF" },
				LuaLine = { bg = C.none }
			}
		end,
	},
}

vim.opt.fillchars = {
	horiz     = " ",
	horizup   = ' ',
	horizdown = ' ',
	vert      = ' ',
	vertleft  = ' ',
	vertright = ' ',
	verthoriz = ' ',
	eob       = " ",
}
-- vim.cmd([[set fillchars=horiz:\ ]])
-- vim.cmd([[set fillchars=vert:\ ]])
vim.cmd.colorscheme "catppuccin"

vim.api.nvim_set_hl(0, "TreesitterContext", { fg = "black", bg = "black" }) -- Set comment color to light gray
vim.api.nvim_set_hl(0, "TreesitterContextBottom", { bg = "black" })         -- Set comment color to light gray
vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { bg = "#000000" })
