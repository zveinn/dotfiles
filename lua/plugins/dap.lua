local dap, dapui = require("dap"), require("dapui")
require('dap-go').setup {
	-- Additional dap configurations can be added.
	-- dap_configurations accepts a list of tables where each entry
	-- represents a dap configuration. For more details do:
	-- :help dap-configuration
	-- dap_configurations = {
	-- 	{
	-- 		type = "go",
	-- 		name = "Golang",
	-- 		mode = "remote",
	-- 		request = "attach",
	-- 	},
	-- },

	-- delve configurations
	delve = {
		-- the path to the executable dlv which will be used for debugging.
		-- by default, this is the "dlv" executable on your PATH.
		path = "dlv",
		-- time to wait for delve to initialize the debug session.
		-- default to 20 seconds
		initialize_timeout_sec = 20,
		-- a string that defines the port to start delve debugger.
		-- default to string "${port}" which instructs nvim-dap
		-- to start the process in a random available port
		port = "${port}",
		-- additional args to pass to dlv
		args = {},
		-- the build flags that are passed to delve.
		-- defaults to empty string, but can be used to provide flags
		-- such as "-tags=unit" to make sure the test suite is
		-- compiled during debugging, for example.
		-- passing build flags using args is ineffective, as those are
		-- ignored by delve in dap mode.
		build_flags = "",
		-- whether the dlv process to be created detached or not. there is
		-- an issue on Windows where this needs to be set to false
		-- otherwise the dlv server creation will fail.
		detached = true,
		-- the current working directory to run dlv from, if other than
		-- the current working directory.
		cwd = nil,
	},
}

dapui.setup(

	{
		controls = {
			element = "repl",
			enabled = true,
			icons = {
				disconnect = "",
				pause = "",
				play = "",
				run_last = "",
				step_back = "",
				step_into = "",
				step_out = "",
				step_over = "",
				terminate = ""
			}
		},
		element_mappings = {},
		expand_lines = true,
		floating = {
			heght = 50,
			border = "single",
			width = 100,
			mappings = {
				close = { "q", "<Esc>" }
			}
		},
		force_buffers = true,
		icons = {
			collapsed = "",
			current_frame = "",
			expanded = ""
		},
		layouts = { {
			elements = { {
				id = "stacks",
				size = 0.40
			}, {
				id = "scopes",
				size = 0.40
			}, {
				id = "watches",
				size = 0.20
			} },
			position = "left",
			size = 40
		}, {
			elements = { {
				id = "console",
				size = 0.30
			}, {
				id = "repl",
				size = 0.35
			}, {
				id = "breakpoints",
				size = 0.33
			} },
			position = "bottom",
			size = 10
		} },
		mappings = {
			edit = "e",
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			repl = "r",
			toggle = "t"
		},
		render = {
			indent = 1,
			max_value_lines = 50
		}
	}

)


vim.keymap.set('n', '<A-b>', dap.toggle_breakpoint)
vim.keymap.set('n', '<A-n>', dap.continue)
-- vim.keymap.set('n', '<A-m>', dap.close)
vim.keymap.set('n', '<A-m>', function()
	dap.close()
	dapui.close()
end, { noremap = true })
vim.keymap.set('n', '<A-,>', dapui.toggle)


-- vim.keymap.set('n', '<A-,>', function()
-- 	dap.continue()
-- 	dapui.toggle()
-- end, { noremap = true })
-- vim.keymap.set('n', '<Abb>', function()
-- 	dapui.float_element("breakpoints", {
-- 		enter = true,
-- 	})
-- end, { noremap = true })
--
local function clear_all_breakpoints()
	local breakpoints = dap.list_breakpoints() or {}

	for _, breakpoint in ipairs(breakpoints) do
		dap.remove_breakpoint(breakpoint)
	end
end


-- vim.keymap.set('n', '<A-9>', clear_all_breakpoints)


dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
