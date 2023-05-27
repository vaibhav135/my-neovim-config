local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
--https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
--local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"graphql",
				"handlebars",
			},
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.markdownlint,
		--diagnostics.markdownlint,
		diagnostics.eslint_d,
	},
	on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_buf_set_keymap
		keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
		--if client.supports_method("textDocument/formatting") then
		--vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		--vim.api.nvim_create_autocmd("BufWritePre", {
		--group = augroup,
		--buffer = bufnr,
		--callback = function()
		---- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
		--vim.lsp.buf.format({ bufnr = bufnr })
		--end,
		--})
		--end
	end,
})