return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>lf", function()
			-- Save current position
			local mark = vim.api.nvim_win_get_cursor(0)
			-- Run eslint_d on the current buffer
			vim.cmd("silent! write")
			vim.cmd("%!eslint_d --stdin --fix-to-stdout --stdin-filename " .. vim.fn.expand("%"))
			-- Restore cursor position
			vim.api.nvim_win_set_cursor(0, mark)
			-- Save the buffer after formatting
			vim.cmd("silent! write")
		end, { desc = "Format with eslint_d" })
	end,
}
