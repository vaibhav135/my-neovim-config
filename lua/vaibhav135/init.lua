vim.cmd.packadd("packer.nvim")

--Required modules
require("lualine").setup({})
require("nvim-autopairs").setup({})
require("impatient")
require("vaibhav135.dashboard")
require("null-ls")
require("impatient")
require("telescope")
require("vaibhav135.toggleterm")
require("vaibhav135.set")
require("nvim-web-devicons").get_icons()
vim.cmd.colorscheme("catppuccin")
--require("gitsigns").setup()

require("packer").startup(function(use)
	-- packer can update itself
	use("wbthomason/packer.nvim")

	--Startup screen for neovim
	use({
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	--Markdown support for neovim
	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	--use({
	--"iamcco/markdown-preview.nvim",
	--run = "cd app && npm install",
	--setup = function()
	--vim.g.mkdp_filetypes = { "markdown" }
	--end,
	--ft = { "markdown" },
	--})

	--Get warnings and errors
	-- Lua
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	--Decrease startup for neovim
	use("lewis6991/impatient.nvim")

	--Terminal in neovim
	use("akinsho/toggleterm.nvim")

	--Code formatting for lua
	use({ "ckipp01/stylua-nvim" })

	--Git signs "git blame"
	use({
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})

	-- LSP
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	--Themes
	use({ "catppuccin/nvim", as = "catppuccin" })

	use("jose-elias-alvarez/null-ls.nvim")
	use("nvim-lua/plenary.nvim")

	--Fancy tabs.
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	--Fancy taskbar
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	--Bracket Provider.
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
end)

