local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
	local opts = {buffer = bufnr, remap = false}

    -- TODO: the remaps are not set on startup but on buffer attach event - that's why the
    -- help wouldn't contain them unless a buffer with LSP support opened

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Go to implementation" })
	vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, { desc = "Go to implementation" })
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, { desc = "Go to implementation" })
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "Show docs - hover" })
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Next diagnostic" })
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Prev diagnostic" })
	vim.keymap.set("n", "<C-a>", function() vim.lsp.buf.code_action() end, { desc = "Code actions" })
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename" })
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { desc = "Signature help" })
	vim.keymap.set("n", "<C-f>", function() vim.lsp.buf.format({async = true}) end, { desc = "Format" })
end)

-- TODO: format on save

local lsp_config = require("lspconfig")

lsp_config.gopls.setup({})

lsp_config.pyright.setup({
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                ignore = { "*" },
                typeCheckingMode = "off",
            },
        },
        exclude = {"/build/**"},
    }
})

local ruff_on_attach = function(client, bufnr)
  if client.name == 'ruff_lsp' then
    client.server_capabilities.hoverProvider = false
  end
end

lsp_config.ruff_lsp.setup {
    on_attach = on_attach,
    init_options = {
        settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
        }
    }
}

lsp_config.tsserver.setup({})

lsp_config.helm_ls.setup {
  settings = {
    ['helm-ls'] = {
      yamlls = {
        enabled = false,
        diagnosticsLimit = 0,
        path = "yaml-language-server",
      }
    }
  }
}

lsp_config.jdtls.setup({})

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
		['<Tab>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-Enter>'] = cmp.mapping.confirm({ select = true }),
		['<Enter>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	}),
})
