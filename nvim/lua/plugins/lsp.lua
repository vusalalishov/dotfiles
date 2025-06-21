local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  local fzf = require("fzf-lua")

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
  vim.keymap.set("n", "<C-r>", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP Rename" }))
  vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP Hover" }))
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to Implementation" }))
  vim.keymap.set("n", "gr", fzf.lsp_references, vim.tbl_extend("force", opts, { desc = "Go to References" }))
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Show Diagnostics" }))
  vim.keymap.set("n", "<C-d>", fzf.lsp_document_symbols, vim.tbl_extend("force", opts, { desc = "Document Symbols" }))
end

return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = vim.g.cmp_capabilities or vim.lsp.protocol.make_client_capabilities()

    lspconfig.pyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.typos_lsp.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.ts_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
    
    lspconfig.nixd.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
