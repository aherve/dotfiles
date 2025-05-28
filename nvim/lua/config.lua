-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("bufferline").setup{}

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup()
require("ibl").setup()
require('mini.icons').setup()
require('render-markdown').setup({
  render_modes = true,
  sign = {
    enabled = false,
  },
  file_types = {'markdown', 'codecompanion'},
})
require("markview").setup({
  lazy = false,
  opts = {
    preview = {
      filetypes = { 'markdown', 'codecompanion' },
      ignore_buftypes = {},
    }
  }
})
require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "copilot",
    },
    inline = {
      adapter = "copilot",
    },
    cmd = {
      adapter = "copilot",
    }
  }
})
