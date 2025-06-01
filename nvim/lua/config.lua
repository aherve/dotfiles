-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[
  filetype plugin indent on
]])

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- mouse
vim.opt.mouse = "n" -- Use mouse (all)

-- commenting behavior
vim.opt.formatoptions:append("ln") -- See :h 'formatoptions' :)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

vim.opt.scrolloff = 4 -- When moving vertical, start scrolling 4 lines before reaching bottom
vim.opt.expandtab = true
vim.opt.autoindent = true -- Indent (based on above line) when adding a line
vim.opt.linebreak = true
vim.opt.tabstop = 2 -- A tab is 2 spaces
vim.opt.softtabstop = 2 -- See 2 spaces per tab
vim.opt.shiftwidth = 2 -- Indent is 2
vim.opt.number = true -- Show lines
vim.opt.showmode = true -- Show mode in status (insertion, visual...)
vim.opt.showcmd = true -- Show beginning of normal commands (try d and see at bottom-right)
vim.opt.ruler = true -- Show line,col in statusbar

-- Windows
vim.opt.splitright = true -- Vsplit at right
-- vim.opt.previewheight = 8 -- Height of preview menu (Omni-completion)

-- Search
vim.opt.wrapscan = true -- Continue to top after reaching bottom
vim.opt.hlsearch = false -- Highlight search
vim.opt.incsearch = true -- See results of search step by step
vim.opt.showmatch = true -- Parenthesis matches
vim.opt.matchtime = 2 -- Show new matching parenthesis for 2/10th of sec


-- Use home directory for swap files
local swap_dir = vim.fn.expand("$HOME/.config/nvim/tmp/swap")

if vim.fn.isdirectory(swap_dir) == 0 then
  vim.fn.mkdir(swap_dir, "p", 0700)
end

vim.opt.directory = swap_dir

-- fzf
vim.opt.rtp:append(vim.fn.expand("~/.fzf"))

-- auto-folding
-- vim.opt.foldenable = true
vim.opt.foldenable = false
vim.opt.foldmethod = "syntax"
vim.opt.foldnestmax = 2
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.fn.line("$") < 60 then
      vim.opt.foldlevel = 1000
    end
  end,
})


vim.g.go_def_mode = 'gopls'
vim.g.go_info_mode = 'gopls'

-- Scala filetype for .sbt
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.sbt",
  callback = function()
    vim.bo.filetype = "scala"
  end,
})

-- Terraform autoformat
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.tf",
  callback = function()
    vim.cmd("TerraformFmt")
  end,
})

-- Apache velocity filetypes
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.vm", "*.shtml", "*.stm", "*.vtl" },
  callback = function()
    vim.bo.filetype = "velocity"
  end,
})

-- C++ autoformat
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.cpp",
  callback = function()
    vim.cmd("Format")
  end,
})

vim.g.closetag_filenames = '*.html,*.jsx,*.tsx'
vim.g.closetag_regions = {
  ['typescript.tsx'] = 'jsxRegion,tsxRegion',
  ['javascript.jsx'] = 'jsxRegion',
}

-- Remap copilot complete (tab is used by coc)
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.keymap.set('i', '<C-k>', 'copilot#Accept("<CR>")', { expr = true, silent = true, script = true })

-- Mergetool settings
vim.g.mergetool_layout = 'mr'
vim.g.mergetool_prefer_revision = 'local'

-- Python host program
vim.g.python3_host_prog = vim.fn.expand('~/.pyenv/shims/python3')
