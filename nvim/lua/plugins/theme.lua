return {
  "morhetz/gruvbox",
  config = function()
    vim.g.gruvbox_italic = 1
    vim.g.gruvbox_contrast_dark = "soft"
    vim.opt.termguicolors = true
    vim.cmd("colorscheme gruvbox")
  end
}
