local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-d>"] = actions.delete_buffer + actions.move_to_top,
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = true,
		},
	},
})

local trouble = require("trouble.providers.telescope")


telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}

vim.keymap.set("n", "<C-f>", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>f", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fg", builtin.grep_string, {})
vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<Space>ds", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<Space>ws", builtin.lsp_workspace_symbols, {})

require('telescope').load_extension('fzf')
