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
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofmt" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				tsx = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
			},
		})
	end,
}
