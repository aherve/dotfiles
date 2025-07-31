return {
	"fatih/vim-go",
	build = ":GoUpdateBinaries",
	config = function()
		-- Set Golang keymaps only for Go filetypes
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "go",
			callback = function()
				vim.keymap.set("n", "<leader>gr", ":GoRun<CR>", { noremap = true, silent = true, buffer = true })
				vim.keymap.set("n", "<leader>gc", ":GoBuild<CR>", { noremap = true, silent = true, buffer = true })
				vim.keymap.set("n", "<leader>gt", ":GoTest!<CR>", { noremap = true, silent = true, buffer = true })
				vim.keymap.set("n", "<leader>gl", ":GoLint<CR>", { noremap = true, silent = true, buffer = true })
			end,
		})
	end,
}
