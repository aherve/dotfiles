return {
  "fatih/vim-go",
  build = ":GoUpdateBinaries",
  config = function() 

    -- Golang keymaps and settings
    vim.keymap.set('n', '<leader>gr', ':GoRun<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gc', ':GoBuild<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gt', ':GoTest!<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gl', ':GoLint<CR>', { noremap = true, silent = true })
  end,
}
