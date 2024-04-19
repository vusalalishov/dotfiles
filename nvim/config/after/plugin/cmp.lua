local autocmd = vim.api.nvim_create_autocmd
local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local lspconfig = require("lspconfig")
local telescope = require("telescope.builtin")
local util = require 'lspconfig.util'

-- lspconfig.pylsp.setup({
--     workspace_folders = {"figo", "tests"},
--     init_options = {
--         workspace = {
--             symbols = {
--                 ignoreFolders = {".venv", "build", "pkg-data", "local"},
--                 maxSymbols = 20,
--             }
--         },
--     },
--     settings = {
--         pylsp = {
--             plugins = {
--                 rope_autoimport = {
--                     enabled = true,
--                 },
--             },
--         },
--     },
-- })

lspconfig.pyright.setup({})

lspconfig.typos_lsp.setup({})

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

local Format = {
    python = function()
        local filename = vim.api.nvim_buf_get_name(0)
        local exit_code = os.execute("black " .. filename .. " &> /dev/null")
        exit_code = exit_code + os.execute("ruff --fix " .. filename .. " &> /dev/null")
        if exit_code == 0 then
            vim.api.nvim_command("e")
        else
            print("Failed to format, exit_code" .. exit_code)
        end
    end,
}

function format()
    vim.api.nvim_command("w")
    Format[vim.bo.filetype]()
    vim.api.nvim_command("w")
    print("Formatted!")
end


vim.keymap.set("n", "ss", format, { desc = "Save changes!"})

vim.keymap.set("n", "<C-f>", format, {})
vim.keymap.set("i", "<C-f>", format, {})

autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.keymap.set('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', opts)
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
    end
})

vim.diagnostic.config({ virtual_text = false })

-- local namespace = vim.api.nvim_create_namespace('whatever')
--
-- vim.diagnostic.set(namespace, 0, {{
--     bufnr = 0,
--     lnum = 118,
--     end_lnum = 118,
--     col = 1,
--     end_col = 2,
--     severity = vim.diagnostic.severity.WARN,
--     message = 'test',
--     source = 'test12',
--     sign = 'F'
-- }})
