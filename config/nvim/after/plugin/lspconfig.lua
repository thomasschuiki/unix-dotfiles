local lsp = require('lsp-zero')
lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
    'gopls',
    'svelte',
    'ansiblels',
    'taplo',
    'bashls',
  },
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end
  }
})

lsp.configure("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        library = { vim.env.VIMRUNTIME },
        checkThirdParty = false,
      },
      diagnostics = { globals = { 'vim' } }
    }
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>dk", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>dj", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>ll", function() vim.diagnostic.set_loclist() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
end)

lsp.setup()
