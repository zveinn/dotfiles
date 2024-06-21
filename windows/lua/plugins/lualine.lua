local setup, lualine = pcall(require, "lualine")
if not setup then return end

local colors = {
	bg       = '#000000',
	fg       = '#bbc2cf',
	yellow   = '#ECBE7B',
	cyan     = '#008080',
	darkblue = '#081633',
	green    = '#98be65',
	orange   = '#FF8800',
	violet   = '#a9a1e1',
	magenta  = '#c678dd',
	blue     = '#51afef',
	red      = '#ec5f67',
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand('%:p:h')
		local gitdir = vim.fn.finddir('.git', filepath .. ';')
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		globalstatus = true,
		-- Disable sections and component separators
		component_separators = '',
		section_separators = '',
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end


ins_left {
	'filename',
	path = 2,
	cond = conditions.buffer_not_empty,
	color = { fg = colors.magenta, gui = 'bold' },
}

ins_left {
	'location',
	padding = { left = 0, right = 0 }, -- We don't need space before this
	color = { fg = colors.blue, gui = 'bold' },
}

-- ins_left {
-- 	function()
-- 		return "|"
-- 	end,
-- }

ins_left {
	'branch',
	icon = "",
	color = { fg = colors.violet, gui = 'bold' },
	padding = { left = 0, right = 0 }, -- We don't need space before this
}

ins_left {
	'diff',
	-- Is it me or the symbol for modified us really weird
	symbols = { added = 'a', modified = 'm', removed = 'r' },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
}

-- ins_left {
-- 	function()
-- 		return "|"
-- 	end,
-- }

ins_left {
	'diagnostics',
	sources = { 'nvim_diagnostic' },
	symbols = { error = 'e', warn = 'w', info = 'i', hint = 'h' },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
		color_hint = { fg = colors.cyan },
	},
}

ins_left {
	-- Lsp server name .
	function()
		local msg = 'NoLsp'
		local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	color = { fg = '#ffffff', gui = 'bold' },
	cond = conditions.hide_in_width,
}

ins_left {
	'o:encoding',      -- option component same as &encoding in viml
	fmt = string.upper, -- I'm not sure why it's upper case either ;)
	color = { fg = colors.green, gui = 'bold' },
	cond = conditions.hide_in_width,
}

ins_left {
	'fileformat',
	fmt = string.upper,
	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
	color = { fg = colors.green, gui = 'bold' },
	cond = conditions.hide_in_width,
}


-- Now don't forget to initialize lualine
lualine.setup(config)
