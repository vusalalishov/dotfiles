return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    require("fzf-lua").setup({
      keymap = {
        builtin = {
          ["<C-n>"] = "preview-down",
          ["<C-p>"] = "preview-up",
        },
      },
    })
    -- Optional keybindings
    vim.keymap.set("n", "ff", "<cmd>FzfLua files<cr>", { desc = "Fzf: Find Files" })
    vim.keymap.set("n", "<C-g>", "<cmd>FzfLua live_grep<cr>", { desc = "Fzf: Project Search (ripgrep)" })
  end,
}
