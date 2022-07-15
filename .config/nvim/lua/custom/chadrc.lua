local M = {}
local opt = vim.opt

M.options = {
  user = function()
    opt.clipboard = "unnamedplus"
    opt.cmdheight = 1
    opt.ruler = false
    opt.hidden = true
    opt.ignorecase = true
    opt.mouse = "a"
    opt.number = true
    opt.numberwidth = 2
    opt.relativenumber = true
    opt.expandtab = true
    opt.shiftwidth = 2
    opt.smartindent = true
    opt.autoindent = true
    opt.smarttab = true
    opt.tabstop = 4
    opt.softtabstop = 4
    opt.timeoutlen = 400
    opt.updatetime = 250
    opt.undofile = true
    opt.modifiable = true
    opt.splitbelow = true
    opt.splitright = true
    opt.scrolloff = 12
    opt.textwidth = 0
    opt.wrapmargin = 1
    opt.formatoptions = "jcroqt"
  end,
}

M.ui = {
  theme = "chadracula"
}


M.mappings = require "custom.mappings"

return M
