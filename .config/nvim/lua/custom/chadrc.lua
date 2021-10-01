-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

-- NOTE: To use this, make a copy with `cp example_chadrc.lua chadrc.lua`

--------------------------------------------------------------------

-- To use this file, copy the strucutre of `core/default_config.lua`,
-- examples of setting relative number & changing theme:

M.options = {
   -- NeoVim/Vim options
   clipboard = "unnamedplus",
   cmdheight = 1,
   ruler = false,
   hidden = true,
   ignorecase = true,
   mapleader = " ",
   mouse = "a",
   number = true,
   -- relative numbers in normal mode tool at the bottom of options.lua
   numberwidth = 2,
   relativenumber = true,
   expandtab = true,
   shiftwidth = 2,
   smartindent = true,
   autoindent = true, -- Good auto indent
   smarttab = true,
   tabstop = 4, -- Number of spaces that a <Tab> in the file counts for
   softtabstop = 4, 
   timeoutlen = 400,
   -- interval for writing swap file to disk, also used by gitsigns
   updatetime = 250,
   undofile = true, -- keep a permanent undo (across restarts)
   -- NvChad options
   nvChad = {
      copy_cut = true, -- copy cut text ( x key ), visual and normal mode
      copy_del = true, -- copy deleted text ( dd key ), visual and normal mode
      insert_nav = true, -- navigation in insertmode
      window_nav = true,
      theme_toggler = false,
      -- used for updater
      update_url = "https://github.com/NvChad/NvChad",
      update_branch = "main",
   },
   modifiable = true,
   splitbelow = true, -- Horizontal splits will automatically be below
   splitright = true, -- Vertical splits will automatically be to the right
   autochdir = true, -- Your working directory will always be the same as your working file
   scrolloff = 12, -- Keep space from bottom and top
   textwidth = 0,
   wrapmargin = 1,
   formatoptions = "jcroqt",
   noshowmode = true,
   noswapfile = true,
}

-- NvChad included plugin options & overrides
M.plugins = {
   -- enable and disable plugins (false for disable)
      status = {
      autosave = false, -- to autosave files
      blankline = true, -- show code scope with symbols
      bufferline = true, -- list open buffers up the top, easy switching too
      colorizer = true, -- color RGB, HEX, CSS, NAME color codes
      comment = true, -- easily (un)comment code, language aware
      dashboard = true, -- NeoVim 'home screen' on open
      esc_insertmode = true, -- map to <ESC> with no lag
      feline = true, -- statusline
      gitsigns = true, -- gitsigns in statusline
      lspsignature = true, -- lsp enhancements
      neoscroll = true, -- smooth scroll
      telescope_media = false, -- media previews within telescope finders
      truezen = false, -- distraction free & minimalist UI mode
      vim_matchup = true, -- % operator enhancements
      cmp = true,
   },
   options = {
      lspconfig = {
         setup_lspconf = "", -- path of file containing setups of different lsps
      },
      nvimtree = {
         enable_git = 0,
      },
      luasnip = {
         snippet_path = {},
      },
      statusline = { -- statusline related options
         -- these are filetypes, not pattern matched
         -- shown filetypes will overrule hidden filetypes
         hidden = {
            "help",
            "dashboard",
            "NvimTree",
            "terminal",
         },
         shown = {},
         -- default, round , slant , block , arrow
         style = "default",
      },
      autosave = false, -- autosave on changed text or insert mode leave
      -- timeout to be used for using escape with a key combination, see mappings.plugins.better_escape
      esc_insertmode_timeout = 300,
   },
   default_plugin_config_replace = {
      luasnip = "custom.luasnip",
   },
}

M.ui = {
  theme = "chadracula"
}

return M