local ls = require("luasnip")
ls.setup({
	snip_env = {
		s = function(...)
			local snip = ls.s(...)
			-- we can't just access the global `ls_file_snippets`, since it will be
			-- resolved in the environment of the scope in which it was defined.
			table.insert(getfenv(2).ls_file_snippets, snip)
		end,
		parse = function(...)
			local snip = ls.parser.parse_snippet(...)
			table.insert(getfenv(2).ls_file_snippets, snip)
		end,
		-- remaining definitions.
	},
  region_check_events = {"InsertEnter"},
})

require("luasnip.loaders.from_lua").load({paths = "./snippets"})

vim.api.nvim_create_autocmd("ModeChanged", {
  group = vim.api.nvim_create_augroup("UnlinkLuaSnipSnippetOnModeChange", {
    clear = true,
  }),
  pattern = { "s:n", "i:*" },
  desc = "Forget the current snippet when leaving the insert mode",
  callback = function(evt)
    -- If we have n active nodes, n - 1 will still remain after a `unlink_current()` call.
    -- We unlink all of them by wrapping the calls in a loop.
    while true do
      if ls.session and ls.session.current_nodes[evt.buf] and not ls.session.jump_active then
        ls.unlink_current()
      else
        break
      end
    end
  end,
})
