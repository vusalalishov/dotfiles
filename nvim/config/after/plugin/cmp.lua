local cmp = require("cmp")
local autocmd = vim.api.nvim_create_autocmd
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local lspconfig = require("lspconfig")
local telescope = require("telescope.builtin")
local util = require 'lspconfig.util'


lspconfig.pyright.setup({
    -- settings = {
    --     python = {
    --         analysis = {
    --             ignore = { '*' },
    --         },
    --     },
    -- },
})

-- lspconfig.pylsp.setup({
--     cmd = vim.lsp.rpc.connect("127.0.0.1", 8282),
-- })

lspconfig.typos_lsp.setup({})

lspconfig.gopls.setup({})

lspconfig.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

lspconfig.helm_ls.setup({
    filetypes = {"helm"},
    root_dir = function(fname)
      local root_files = {
        "Chart.yaml",
        "Chart.lock",
        "values.yaml",
      }
      return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
    end
})

lspconfig.yamlls.setup({})

lspconfig.lua_ls.setup({})

lspconfig.ts_ls.setup({})

cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    sources = {
        {name = "path"},
        {name = "nvim_lsp"},
        {name = "buffer", keyword_length = 3},
        {name = "nvim_lsp_signature_help"}
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<Tab>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-Enter>"] = cmp.mapping.confirm({ select = true }),
        ["<Enter>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
})

function split_definition ()
    vim.cmd('vsplit')
    vim.cmd('Telescope lsp_definitions')
end

autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.keymap.set('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', opts)
        -- vim.keymap.set('n', 'Gd', split_definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', '<Cmd>Telescope lsp_implementations<CR>', opts)
        vim.keymap.set('n', '<Leader>k', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.keymap.set('i', '<C-s>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.keymap.set('n', '<Leader>D', '<Cmd>Telescope lsp_type_definitions<CR>', opts)
        vim.keymap.set('n', '<Leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.keymap.set('n', 'gr', telescope.lsp_references, opts)
        vim.keymap.set('n', '<Leader>e', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
        vim.keymap.set('n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        vim.keymap.set('n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
        vim.keymap.set("i", "<C-f>", vim.lsp.buf.format, opts)
    end,
})
