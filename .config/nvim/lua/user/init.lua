return {
  -- Set colorscheme to use
  colorscheme = "dracula",

  options = {
    opt = {
      -- set to true or false etc.
      clipboard = "unnamedplus",
      cmdheight = 1,
      ruler = false,
      hidden = true,
      ignorecase = true,
      mouse = "a",
      number = true,
      numberwidth = 2,
      relativenumber = true,
      expandtab = true,
      shiftwidth = 2,
      smartindent = true,
      autoindent = true,
      smarttab = true,
      tabstop = 4,
      softtabstop = 4,
      timeoutlen = 400,
      updatetime = 250,
      undofile = true,
      modifiable = true,
      splitbelow = true,
      splitright = true,
      scrolloff = 12,
      textwidth = 0,
      wrapmargin = 1,
      wrap = true,
      formatoptions = "jcroqt",
      wildignorecase = true,
    },
  },
  
  plugins = {
    { "Mofiqul/dracula.nvim" },
  },

  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      ["<A-S-k>"] = { "<cmd> resize +2 <cr>", desc = "increase window horizontal size" },
      ["<A-S-j>"] = { "<cmd> resize -2 <cr>", desc = "decrease window horizontal size" },
      ["<A-S-l>"] = { "<cmd> vertical resize +2 <cr>", desc = "increase window vertical size" },
      ["<A-S-h>"] = { "<cmd> vertical resize -2 <cr>", desc = "decrease window vertical size" },
      ["<A-j>"] = { "<cmd> m +1 <cr>", desc = "move line down" },
      ["<A-k>"] = { "<cmd> m -2 <cr>", desc = "move line up" },
    },
  },
}

