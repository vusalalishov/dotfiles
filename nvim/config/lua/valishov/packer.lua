vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.8",
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

    use("mfussenegger/nvim-jdtls")

    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }

    use("neovim/nvim-lspconfig")

    use({
        "hrsh7th/nvim-cmp",
        as = "cmp",
        requires = {
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/nvim_lsp_signature_help"},
            {"L3MON4D3/LuaSnip"},
            {"saadparwaiz1/cmp_luasnip"},
        },
    })


end)
