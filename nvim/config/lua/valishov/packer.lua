vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.5",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	use({
		"neanias/everforest-nvim",
		as = "everforest",
		config = function()
			vim.cmd("colorscheme everforest")
		end
	})

	use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
	use("tpope/vim-fugitive")

    use("L3MON4D3/LuaSnip")
    use("mfussenegger/nvim-jdtls")

	use {
		"VonHeikemen/lsp-zero.nvim", branch = "v3.x",
		as = "lsp-zero",
		requires = {
			-- LSP Support
			{"neovim/nvim-lspconfig"},

			-- Autocompletion
			{"hrsh7th/nvim-cmp"},
			{"hrsh7th/cmp-buffer"},
			{"hrsh7th/cmp-path"},
			{"hrsh7th/cmp-nvim-lsp"},
            {"saadparwaiz1/cmp_luasnip"},
		}
	}

    use("towolf/vim-helm")

end)
