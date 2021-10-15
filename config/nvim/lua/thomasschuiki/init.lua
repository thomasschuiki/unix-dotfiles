local function init()
  require 'thomasschuiki.vim'.init()
  require 'thomasschuiki.packer'.init()
end

return {
  init = init,
}
