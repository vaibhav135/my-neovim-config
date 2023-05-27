local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

lspconfig.yamlls.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	settings = {
		yaml = {
			format = {
				enable = true,
			},
			schemas = {
				kubernetes = "*.yaml",
				--["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.27.2/all.json"] = "/*.yaml",
				["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
			keyOrdering = false,
			validate = true,
			hover = true,
		},
	},
})

