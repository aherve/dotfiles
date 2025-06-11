return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters = {
				gofmt = {
					condition = function(ctx)
						local diagnostics = vim.diagnostic.get(ctx.buf)
						return vim.tbl_isempty(diagnostics)
					end,
				},
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				--python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				--rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				go = { "goimports", "gofmt" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
			},
		})
	end,
}
