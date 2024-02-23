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
		}
	}

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use("towolf/vim-helm")

end)
