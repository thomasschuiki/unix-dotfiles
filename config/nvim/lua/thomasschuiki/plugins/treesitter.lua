local function init()
require('nvim-treesitter.configs').setup {
	ensure_installed = {
    'bash',
    'comment',
    'css',
    'dockerfile',
    'go',
    'gomod',
    'graphql',
    'hcl',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'latex',
    'lua',
    'python',
    'regex',
    'vue',
    'yaml',
  }, 
	highlight = {
    enable = true
  },
  incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  indent = {
    enable = true
  }
}
end

return {
  init = init
}
