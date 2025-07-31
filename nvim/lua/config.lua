-- disable netrw at the very start of your init.lua
vim.loader.enable(false)
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

vim.g.go_def_mode = "gopls"
vim.g.go_info_mode = "gopls"

vim.g.closetag_filenames = "*.html,*.jsx,*.tsx"
vim.g.closetag_regions = {
	["typescript.tsx"] = "jsxRegion,tsxRegion",
	["javascript.jsx"] = "jsxRegion",
}

-- Remap copilot complete (tab is used by coc)
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.keymap.set("i", "<C-k>", function()
	return vim.fn["copilot#Accept"]()
end, { expr = true, silent = true, replace_keycodes = false })

-- Mergetool settings
vim.g.mergetool_layout = "mr"
vim.g.mergetool_prefer_revision = "local"

-- Python host program
vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/shims/python3")

-- git gutter: always display signs column (avoid flickering)
vim.opt.signcolumn = "yes"
