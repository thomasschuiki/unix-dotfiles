local function init()
	require("trim").setup({
    disable = {
      "markdown"
    },
	})
end

return {
	init = init,
}
