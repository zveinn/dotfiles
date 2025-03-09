local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then return end

local lspkind_setup, lspkind = pcall(require, "lspkind")
if not lspkind_setup then return end

local lspconfig_setup, lspconfig = pcall(require, "lspconfig")
if not lspconfig_setup then return end

local cmp_nvim_lsp_setup, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_setup then return end

local mason_setup, mason = pcall(require, "mason")
if not mason_setup then return end
mason.setup({})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
	preselect = cmp.PreselectMode.None,
	complete = {
		completeopt = "menu, menuone, noinsert, noselect"
	},


	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
			-- luasnip.available(args.body)
			-- luasnip.snip_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		-- ['<C-n>'] = cmp.mapping.select_next_item(),
		-- ['<C-p>'] = cmp.mapping.select_prev_item(),
		--['<C-d>'] = cmp.mapping.scroll_docs(-4),
		-- ['<C-f>'] = cmp.mapping.scroll_docs(4),
		-- ['<C-Space>'] = cmp.mapping.complete {},
		--
		['<CR>'] = cmp.mapping.confirm {
			-- behavior = cmp.ConfirmBehavior.Replace,
			behavior = cmp.ConfirmBehavior.Select,
			select = true,
		},
		-- ["<Tab>"] = vim.schedule_wrap(function(fallback)
		-- 	if cmp.visible() and has_words_before() then
		-- 		cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		-- 	else
		-- 		fallback()
		-- 	end
		-- end),

		-- ['<Tab>'] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	elseif luasnip.expand_or_locally_jumpable() then
		-- 		luasnip.expand_or_jump()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { 'i', 's' }),

		-- ['<S-K>'] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	elseif luasnip.locally_jumpable(-1) then
		-- 		luasnip.jump(-1)
		-- 	else
		-- 		fprev_iteprev_iteprev_item()
		-- 	end
		-- end, { 'i', 's' }),
		['<C-k>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { 'i', 's' }),

		['<C-j>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp', priority = 90 },
		{ name = 'luasnip',  priority = 70 },
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			max_width = 200,

			symbol_map = {}
		})
	},
}


-- cmp.setup {
--   formatting = {
--     format = lspkind.cmp_format({
--       mode = "symbol_text",
--       maxwidth = 50,
--
--       before = function(entry, vim_item)
--         return vim_item
--       end
--     })
--   }
-- }
--
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
luasnip.add_snippets("go", {
	s("ra", {
		t({ "for i,v := range " }), i(1), t({ " {", "\t", "}" }),
	})
})
luasnip.add_snippets("go", {
	s("sel", {
		t({ "select " }), i(1), t({ " {", 'case :', "default:", "}" }),
	})
})
luasnip.add_snippets("go", {
	s("s", {
		t({ "type " }), i(1), t({ " struct {", "\t", "}" }),
	})
})
luasnip.add_snippets("go", {
	s("e", {
		t({ "if err != nil {", '\tpanic(err)', "}" }),
	})
})

luasnip.add_snippets("go", {
	s("ap", {
		t({ "atomic.Pointer[" }), i(1), t({ "]" }),
	})
})
luasnip.add_snippets("go", {
	s("a", {
		t({ "atomic." }), i(1),
	})
})
luasnip.add_snippets("go", {
	s("ab", {
		t({ "atomic.Bool" })
	})
})

luasnip.add_snippets("go", {
	s("d", {
		t(
			{ "defer func(){"
			, "\tr := recover()"
			, "\tif r != nil {"
			, "\t\tlog.Println(r, string(debug.Stack()))"
			, "\t}"
			, "}()"
			})
	})
})

vim.api.nvim_create_augroup('AutoFormatting', {})

local on_attach2 = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	vim.keymap.set({ 'n', 'v' }, '<S-c>', vim.lsp.buf.code_action)
	vim.keymap.set({ 'n', 'v' }, 'r', vim.lsp.buf.rename)

	vim.keymap.set({ 'n', 'v' }, 'q', vim.lsp.buf.signature_help)
	vim.keymap.set({ 'n', 'v' }, '<S-q>', vim.lsp.buf.hover)


	--	requires vim.opt.splitright = true
	nmap('<C-m>', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('m', ':vsp<cr> :lua vim.lsp.buf.definition()<CR><CR>zz', '[G]oto [D]efinition')
	--nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')


	-- See `:help K` for why this keymap
	-- nmap('<A-e>', vim.lsp.buf.type_definition, 'Type [D]efinition') -- SAME AS ALT+P

	-- Lesser used LSP functionality
	--	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	--	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	--	nmap('<leader>wl', function()
	--		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	--	end, '[W]orkspace [L]ist Folders')


	-- vim.api.nvim_create_autocmd("InsertLeave", {
	-- 	group = 'AutoFormatting',
	-- 	pattern = '*.*',
	-- 	callback = function()
	-- 		vim.lsp.buf.format()
	-- 		vim.api.nvim_command("wall")
	-- 	end,
	-- })
	--

	vim.api.nvim_create_autocmd('BufWritePre', {
		pattern = '*.*',
		group = 'AutoFormatting',
		callback = function()
			vim.lsp.buf.format()
		end,
	})
end


local configs = require 'lspconfig/configs'

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.json", -- Restrict to JSON files
  group = "AutoFormatting",
  callback = function()
    vim.cmd("%!jq .") -- Filter the entire buffer through jq
  end,
})

configs.golangcilsp = {
	default_config = {
		cmd = { 'golangci-lint-langserver' },
		root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
		init_options = {
			command = { 'golangci-lint', 'run', '--out-format', 'json', "--enable-all" },
			-- command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" },

		}
	},
}
lspconfig.golangci_lint_ls.setup {
	filetypes = { '.go', 'go.mod', "go.env" },
	capabilities = capabilities,
	on_attach = on_attach2,
}

lspconfig.clangd.setup {
	cmd = {
		"clangd",
		"--background-index",
		"--cross-file-rename",
		"--completion-style=detailed",
		"--clang-tidy",
		"--clang-tidy-checks=*",
		"--all-scopes-completion",
	},
	on_attach = on_attach2,
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	single_file_support = true,
}


-- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
lspconfig['gopls'].setup {
	capabilities = capabilities,
	on_attach = on_attach2,
	settings = {
		gopls = {
			buildFlags = { "-tags=rdmainter" },
			gofumpt = true,
			analyses = {
				assign = true,
				atomic = true,
				bools = true,
				composites = true,
				copylocks = true,
				deepequalerrors = true,
				embed = true,
				errorsas = true,
				fieldalignment = false, -- lets you know about struct sizes
				httpresponse = true,
				ifaceassert = true,
				loopclosure = true,
				lostcancel = true,
				nilfunc = true,
				nilness = true,
				nonewvars = true,
				printf = true,
				shadow = false, -- lets you know about duplicate err declerations
				shift = true,
				simplifycompositelit = true,
				simplifyrange = true,
				simplifyslice = true,
				sortslice = true,
				stdmethods = true,
				stringintconv = true,
				structtag = true,
				testinggoroutine = true,
				tests = true,
				timeformat = true,
				unmarshal = true,
				unreachable = true,
				unsafeptr = true,
				unusedparams = true,
				unusedresult = true,
				unusedvariable = true,
				unusedwrite = true,
				unusedfunc = true,
				useany = true,
			},
			hoverKind = "FullDocumentation",
			-- linkTarget = "pkg.go.dev",
			-- usePlaceholders = true,
			vulncheck = "Imports",
		},
	},
}

-- lspconfig.efm.setup {
-- 	capabilities = capabilities,
-- 	filetypes = { 'css', 'scss' },
-- 	filetypes = {},
-- 	on_attach = on_attach2,
-- 	init_options = { documentFormatting = true },
-- 	settings = {
-- 		languages = {
-- 			css = {
-- 				{ formatCommand = 'prettier "${INPUT}"', formatStdin = true, }
-- 			},
-- 			scss = {
-- 				{ formatCommand = 'prettier "${INPUT}"', formatStdin = true, }
-- 			}
-- 		}
-- 	}
-- }

lspconfig.eslint.setup {
	capabilities = capabilities,
	-- on_attach = on_attach2,
	-- root_dir = require 'lspconfig/util'.root_pattern('package.json', '.eslintrc', '.git'),
	root_dir = require 'lspconfig/util'.root_pattern(
		'.eslintrc',
		'.eslintrc.js',
		'.eslintrc.cjs',
		'.eslintrc.yaml',
		'.eslintrc.yml',
		'.eslintrc.json',
		'package.json',
		'.git'
	),

	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
}

lspconfig.ts_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach2,
})

lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach2,
	settings = {
		css = {
			validate = true
		},
		less = {
			validate = true
		},
		scss = {
			validate = true
		}
	}
})

lspconfig.html.setup({
	capabilities = capabilities,
	on_attach = on_attach2,
	settings = { filetypes = { 'html', 'twig', 'hbs' } },
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach2,
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	}
})
