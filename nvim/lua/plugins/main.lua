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
  { "morhetz/gruvbox", config = function()
      vim.g.gruvbox_italic = 1
      vim.g.gruvbox_contrast_dark = "soft"
      vim.opt.termguicolors = true
      vim.cmd("colorscheme gruvbox")
    end
  },

  require('plugins.telescope'),
  require('plugins.vim-go'),

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {'hrsh7th/nvim-cmp'},                  -- Autocomplete engine
  {'hrsh7th/cmp-nvim-lsp'},              -- Completion source for LSP
  {'L3MON4D3/LuaSnip'},                  -- Snippet engine


  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  "Lokaltog/vim-easymotion",
  "airblade/vim-gitgutter",
  "alvan/vim-closetag",
  "artoj/pgn-syntax-vim",
  "blueyed/vim-diminactive",
  "chrisbra/csv.vim",
  "derekwyatt/vim-scala",
  "ekalinin/Dockerfile.vim",
  "github/copilot.vim",
  "hashivim/vim-terraform",
  "jiangmiao/auto-pairs",
  "jparise/vim-graphql",
  { "junegunn/fzf", build = function() vim.fn["fzf#install"]() end },
  "junegunn/fzf.vim",
  "jxnblk/vim-mdx-js",
  "leafgarland/typescript-vim",
  "lepture/vim-velocity",
  "lervag/vimtex",
  "maxmellon/vim-jsx-pretty",
  --{ "neoclide/coc.nvim", branch = "release" },
  "neoclide/jsonc.vim",
  "nikvdp/ejs-syntax",
  "othree/html5.vim",
  "pangloss/vim-javascript",
  "rhysd/vim-clang-format",
  "samoshkin/vim-mergetool",
  "scrooloose/nerdcommenter",
  {
    "OXY2DEV/markview.nvim",
    opts = {
      preview = {
        filetypes = { 'markdown', 'codecompanion' },
        ignore_buftypes = {},
      }
    }
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      render_modes = true,
      sign = {
        enabled = false,
      },
      file_types = {'markdown', 'codecompanion'},
    }
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {
      strategies = {
        chat = {
          adapter = "copilot",
        },
        inline = {
          adapter = "copilot",
        },
        cmd = {
          adapter = "copilot",
        }
      }
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  "echasnovski/mini.nvim",
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
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
  "vim-airline/vim-airline",
  "vim-scripts/svg.vim",
  "xolox/vim-misc",
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup {}
    end,
  },
  --{ "yaegassy/coc-ruff", build = "yarn install --frozen-lockfile" },
})

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  },
  mapping = {
        -- ... Your other mappings ...
   ['<CR>'] = cmp.mapping(function(fallback)
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
    end
  },
})

local lsp_cmds = vim.api.nvim_create_augroup('lsp_cmds', {clear = true})

vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_cmds,
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, {buffer = true})
    end

    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    bufmap({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})

