return {
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.g.everforest_background = "hard"
      vim.g.everforest_enable_italic = 0
      vim.g.everforest_transparent_background = 0
      vim.cmd.colorscheme('everforest')
    end
  }
}
