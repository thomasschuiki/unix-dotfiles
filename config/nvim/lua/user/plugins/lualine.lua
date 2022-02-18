local function init()
	require("lualine").setup({
		options = {
			extensions = { "fzf" },
			theme = "gruvbox",
		},
	})
end

return {
	init = init,
}
