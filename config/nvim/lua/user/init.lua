local function init()
  require 'user.vim'.init()
  require 'user.packer'.init()
end

return {
  init = init,
}
