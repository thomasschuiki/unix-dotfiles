local function init()
  -- Theme settings
  vim.g['sonokai_style'] = 'espresso'

  -- Load colorscheme
  vim.cmd[[colorscheme sonokai]]
end

return {
  init = init
}
