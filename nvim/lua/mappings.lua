-- Key mappings converted from Vimscript to Lua for Neovim
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "Y", "y$", opts)
map("n", "-", "<C-w>w", opts)
map("n", "H", "^", opts)
map("n", "L", "$", opts)
map("v", "L", "$", opts)
map("n", "*", "*zz", opts)
map("n", "<Tab>", ":bn<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "<space>", "<PageDown>", opts)

-- vim-projectionist quickey (ag: alternate go)
map("n", "<Leader>ag", ":A<CR>", { desc = "projectionist: alternate go" })
