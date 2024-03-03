require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'comment',
    'css',
    'dockerfile',
    'go',
    'gomod',
    'hcl',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'latex',
    'lua',
    'markdown',
    'python',
    'regex',
    'sql',
    'svelte',
    'toml',
    'typescript',
    'vue',
    'yaml',
  },
  ignore_install = {},
  modules = {},
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlightin = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
  indent = {
    enable = true,
    disable = { "python" }
  }
}
