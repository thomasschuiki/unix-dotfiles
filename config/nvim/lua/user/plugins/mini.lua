local function init()
  require('mini.comment').setup({})
  require('mini.surround').setup({})
  require('mini.trailspace').setup({})
end

return {
	init = init,
}
