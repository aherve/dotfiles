return {
	"olimorris/codecompanion.nvim",
	name = "codecompanion",
	--dir = "/home/aurel/Work/codecompanion.nvim-main",
	opts = {
		strategies = {
			chat = {
				adapter = {
					name = "gemini",
					model = "gemini-3.1-flash-lite",
				},
			},
			inline = {
				adapter = {
					name = "gemini",
					model = "gemini-3.1-flash-lite",
				},
			},
			cmd = {
				adapter = {
					name = "gemini",
					model = "gemini-3.1-flash-lite",
				},
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
