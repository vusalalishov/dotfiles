return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>g", ":botright Git<CR>", { desc = "Git command (bottom split)" })
    end,
  }
}
