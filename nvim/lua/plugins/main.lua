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

  -- Plugin list
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
  { "neoclide/coc.nvim", branch = "release" },
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
  { "yaegassy/coc-ruff", build = "yarn install --frozen-lockfile" },
})

