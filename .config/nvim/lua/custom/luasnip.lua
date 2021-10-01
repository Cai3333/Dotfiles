local present, luasnip = pcall(require, "luasnip")
local chadrc_config = require("core.utils").load_config()

if not present then
   return
end

local s = luasnip.snippet
local sn = luasnip.snippet_node
local isn = luasnip.indent_snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local events = require("luasnip.util.events")

luasnip.config.set_config {
   history = true,
   updateevents = "TextChanged,TextChangedI",
}

luasnip.snippets = {
	-- When trying to expand a snippet, luasnip first searches the tables for
	-- each filetype specified in 'filetype' followed by 'all'.
	-- If ie. the filetype is 'lua.c'
	--     - luasnip.lua
	--     - luasnip.c
	--     - luasnip.all
	-- are searched in that order.
	all = {
      s("trigger", {
         t({"", "After expanding, the cursor is here ->"}), i(1),
         t({"","After jumping forward once, cursor is here ->"}), i(2),
         t({"", "After jumping once more, the snippet is exited there ->"}), i(0),
      })

	},
	tex = {
		-- rec_ls is self-referencing. That makes this snippet 'infinite' eg. have as many
		-- \item as necessary by utilizing a choiceNode.
		s("bigskip", {
			t({"", "\\bigskip", ""}),
		}),
		s("mat2x2", {
			t({"\\begin{pmatrix}", ""}),
         i(1), t({" & "}), i(2), t({"\\\\", ""}),
         i(3), t({" & "}), i(4), t({""}),
			t({"", "\\end{pmatrix}"}),
		}),
		s("linemat2x2", {
			t({"\\begin{pmatrix} "}),
         i(1), t({" & "}), i(2), t({" \\\\ "}),
         i(3), t({" & "}), i(4),
			t({" \\end{pmatrix}"}),
		}),
      s("idmat2x2", {
			t({"\\begin{pmatrix} "}),
         t({"1 & 0"}), t({" \\\\ "}),
         t({"0 & 1"}),
			t({" \\end{pmatrix}"}),
		}),
      s("mat2x3", {
			t({"\\begin{pmatrix}", ""}),
         i(1), t({" & "}), i(2), t({" & "}), i(3),t({"\\\\", ""}),
         i(4), t({" & "}), i(5), t({" & "}), i(6),t({""}),
			t({"", "\\end{pmatrix}"}),
		}),
		s("linemat2x3", {
			t({"\\begin{pmatrix} "}),
         i(1), t({" & "}), i(2), t({" & "}), i(3), t({" \\\\ "}),
         i(4), t({" & "}), i(5), t({" & "}), i(6),
			t({" \\end{pmatrix}"}),
		}),
		s("mat3x2", {
			t({"\\begin{pmatrix}", ""}),
         i(1), t({" & "}), i(2), t({"\\\\", ""}),
         i(3), t({" & "}), i(4), t({"\\\\", ""}),
         i(5), t({" & "}), i(6), t({""}),
			t({"", "\\end{pmatrix}"}),
		}),
		s("linemat3x2", {
			t({"\\begin{pmatrix} "}),
         i(1), t({" & "}), i(2), t({" \\\\ "}),
         i(3), t({" & "}), i(4), t({" \\\\ "}),
         i(5), t({" & "}), i(6),
			t({" \\end{pmatrix}"}),
		}),
	},
}

require("luasnip/loaders/from_vscode").load { path = { chadrc_config.plugins.options.luasnip.snippet_path } }