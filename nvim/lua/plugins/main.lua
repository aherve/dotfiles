-- Install Lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugin configuration
require("lazy").setup({
	-- Colorscheme
	require("plugins.theme"),
	require("plugins.telescope"),
	require("plugins.vim-go"),
	require("plugins.codecompanion"),
	require("plugins.mason"),
	require("plugins.conform"),
	require("plugins.lint"),
	require("plugins.autopairs"),
	require("plugins.lualine"),

	{ "hrsh7th/nvim-cmp" }, -- Autocomplete engine
	{ "hrsh7th/cmp-nvim-lsp" }, -- Completion source for LSP
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	}, -- Snippet engine

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	"Lokaltog/vim-easymotion",
	"airblade/vim-gitgutter",
	"alvan/vim-closetag",
	"artoj/pgn-syntax-vim",
	"blueyed/vim-diminactive",
	"chrisbra/csv.vim",
	"github/copilot.vim",
	"jxnblk/vim-mdx-js",
	"leafgarland/typescript-vim",
	"lepture/vim-velocity",
	"lervag/vimtex",
	"maxmellon/vim-jsx-pretty",
	"neoclide/jsonc.vim",
	"nikvdp/ejs-syntax",
	"othree/html5.vim",
	"rhysd/vim-clang-format",
	"samoshkin/vim-mergetool",
	"scrooloose/nerdcommenter",
	--[[
		 [{
		 [  "OXY2DEV/markview.nvim",
		 [  opts = {
		 [    preview = {
		 [      filetypes = { "markdown", "codecompanion" },
		 [      ignore_buftypes = {},
		 [    },
		 [  },
		 [},
     ]]
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			render_modes = true,
			file_types = { "markdown", "codecompanion" },
		},
	},
	"echasnovski/mini.nvim",
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	"stevearc/vim-arduino",
	"tpope/vim-abolish",
	"tpope/vim-dotenv",
	"tpope/vim-fugitive",
	"tpope/vim-projectionist",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"uarun/vim-protobuf",
	"vickenty/vim-hive",
	"vim-scripts/svg.vim",
	"xolox/vim-misc",
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({})
		end,
	},
})

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	mapping = {
		-- ... Your other mappings ...
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if luasnip.expandable() then
					luasnip.expand()
				else
					cmp.confirm({
						select = true,
					})
				end
			else
				fallback()
			end
		end),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
})

local lsp_cmds = vim.api.nvim_create_augroup("lsp_cmds", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_cmds,
	desc = "LSP actions",
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			vim.keymap.set(mode, lhs, rhs, { buffer = true })
		end

		bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
		bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
		bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
		bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
		bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
		bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
		bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
		bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
		bufmap({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")
		bufmap("n", "<leader>ta", "<cmd>lua vim.lsp.buf.code_action()<cr>")
		bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
		bufmap("n", "[c", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
		bufmap("n", "]c", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	end,
})
