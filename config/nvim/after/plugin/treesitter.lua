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
    'help',
    'javascript',
    'jsdoc',
    'json',
    'latex',
    'lua',
    'python',
    'regex',
    'rust',
    'svelte',
    'sql',
    'toml',
    'typescript',
    'vue',
    'yaml',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlightin = false,
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
    enable = true,
    disable = { "python" }
  }
}
