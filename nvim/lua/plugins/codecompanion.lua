return {
	"olimorris/codecompanion.nvim",
	name = "codecompanion",
	--dir = "/home/aurel/Work/codecompanion.nvim-main",
	opts = {
		strategies = {
			chat = {
				adapter = "gemini",
			},
			inline = {
				adapter = "copilot",
			},
			cmd = {
				adapter = "copilot",
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
