local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
	local opts = {buffer = bufnr, remap = false}

    -- TODO: the remaps are not set on startup but on buffer attach event - that's why the
    -- help wouldn't contain them unless a buffer with LSP support opened

	Remap("n", "gd", function() vim.lsp.buf.definition() end, opts, "Go to implementation")
	Remap("n", "gr", function() vim.lsp.buf.references() end, opts, "Go to implementation")
	Remap("n", "gi", function() vim.lsp.buf.implementation() end, opts, "Go to implementation")
	Remap("n", "K", function() vim.lsp.buf.hover() end, opts, "Show docs - hover")
	Remap("n", "[d", function() vim.diagnostic.goto_next() end, opts, "Next diagnostic")
	Remap("n", "]d", function() vim.diagnostic.goto_prev() end, opts, "Prev diagnostic")
	Remap("n", "<C-a>", function() vim.lsp.buf.code_action() end, opts, "Code actions")
	Remap("n", "<leader>r", function() vim.lsp.buf.rename() end, opts, "Rename")
	Remap("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts, "Signature help")
	Remap("n", "<C-f>", function() vim.lsp.buf.format({async = true}) end, opts, "Format")
end)

-- TODO: format on save

local lsp_config = require("lspconfig")

lsp_config.gopls.setup({})

lsp_config.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        },
        pylint = {
            enabled = false
        }
      }
    }
  }
}

lsp_config.pyright.setup({
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off"
            },
            exclude = {"/build/**"}
        },
    }
})

lsp_config.tsserver.setup({})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'tsserver'},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	}
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
	sources = {
		{name = 'path'},
		{name = 'nvim_lsp'},
		{name = 'nvim_lua'},
		{name = 'luasnip', keyword_length = 2},
		{name = 'buffer', keyword_length = 3},
	},
	formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	}),
})
