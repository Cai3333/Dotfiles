local M = {}

M.extras = {
  n = {
    ["<A-S-k>"] = {"<cmd> resize +2 <CR>", "increase window horizontal size"},
    ["<A-S-j>"] = {"<cmd> resize -2 <CR>", "decrease window horizontal size"},
    ["<A-S-l>"] = {"<cmd> vertical resize +2 <CR>", "increase window vertical size"},
    ["<A-S-h>"] = {"<cmd> vertical resize -2 <CR>", "decrease window vertical size"},
    ["<A-j>"] = {"<cmd> m +1 <CR>", "move line down"},
    ["<A-k>"] = {"<cmd> m -2 <CR>", "move line up"},
  },
}

return M
