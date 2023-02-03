local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
  'gopls',
  'svelte',
  'ansiblels',
  'taplo',
  'bashls',
})

-- nvim-cmp setup
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<C-Space>'] = cmp.mapping.complete(),

})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function (client, bufnr)
  local opts = {buffer = bufnr, remap = false}

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

-- local function default_on_attach(client, bufnr)
--   vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--
--   -- Mappings.
--   local opts = { noremap = true, silent = true }
--   vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--   vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
--   vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
--   vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--   vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--   vim.keymap.set("n", "<leader>dk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
--   vim.keymap.set("n", "<leader>dj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
--   vim.keymap.set("n", "<leader>aw", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
--   vim.keymap.set("n", "<leader>rw", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
--   vim.keymap.set("n", "<leader>lw", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
--   vim.keymap.set("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
--   vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
--   vim.keymap.set("n", "<leader>rf", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--   vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
--   vim.keymap.set("n", "<leader>ll", "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)
--   vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
--   vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
--
--   -- Set some keybinds conditional on server capabilities
--   if client.server_capabilities.document_formatting then
--     vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--   elseif client.server_capabilities.document_range_formatting then
--     vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
--   end
--
--   -- Set autocommands conditional on server_capabilities
--   if client.server_capabilities.document_highlight then
--     --hi LspReferenceRead cterm=bold ctermbg=red guibg=blue
--     --hi LspReferenceText cterm=bold ctermbg=red guibg=blue
--     --hi LspReferenceWrite cterm=bold ctermbg=red guibg=blue
--     vim.api.nvim_exec(
--       [[
--         augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--         augroup END
--         ]],
--       false
--     )
--   end
-- end
--
-- local function setup_diagnostics()
--   -- LSP Enable diagnostics
--   vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--     virtual_text = {
--       prefix = "»",
--       spacing = 4,
--     },
--     underline = true,
--     signs = true,
--     update_in_insert = false,
--   })
--
--   vim.fn.sign_define("DiagnosticsSignError", { text = "", texthl = "DiagnosticsDefaultError" })
--   vim.fn.sign_define("DiagnosticsSignWarn", { text = "", texthl = "DiagnosticsDefaultWarn" })
--   vim.fn.sign_define("DiagnosticsSignInfo", { text = "", texthl = "DiagnosticsDefaultInfo" })
--   vim.fn.sign_define("DiagnosticsSignHint", { text = "", texthl = "DiagnosticsDefaultHint" })
--
-- end
--
-- local function default_capabilities()
--   local capabilities = vim.lsp.protocol.make_client_capabilities()
--
--   -- Add additional capabilities supported by nvim-cmp
--   capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
--
--   capabilities.textDocument.completion.completionItem.snippetSupport = true
--   capabilities.textDocument.completion.completionItem.resolveSupport = {
--     properties = {
--       "documentation",
--       "detail",
--       "additionalTextEdits",
--     },
--   }
--
--   -- Code actions
--   capabilities.textDocument.codeAction = {
--     dynamicRegistration = true,
--     codeActionLiteralSupport = {
--       codeActionKind = {
--         valueSet = (function()
--           local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
--           table.sort(res)
--           return res
--         end)(),
--       },
--     },
--   }
--
--   return capabilities
-- end
--
-- local function default_config()
--   return {
--     capabilities = default_capabilities(),
--     on_attach = default_on_attach
--   }
-- end
--
-- local servers = {}
-- servers["gopls"] = {
--   settings = {
--     gopls = {
--       analyses = {
--         unusedparams = true,
--       },
--       staticcheck = true,
--     },
--   }
-- }
-- servers["yamlls"] = {}
-- servers["bashls"] = {}
-- servers["pylsp"] = {
--   settings = {
--     pylsp = {
--       plugins = {
--         black = {
--           enabled = true,
--         },
--       },
--     }
--   }
-- }
-- servers["tsserver"] = {
--   on_attach = function(client, bufnr)
--
--     client.server_capabilities.document_formatting = false
--     client.server_capabilities.document_range_formatting = false
--
--     local ts_utils = require("nvim-lsp-ts-utils")
--     ts_utils.setup({
--       eslint_bin = "eslint_d",
--       eslint_enable_diagnostics = true,
--       eslint_enable_code_actions = true,
--       enable_formatting = true,
--       formatter = "prettier",
--     })
--     ts_utils.setup_client(client)
--
--     local opts = { noremap = true, silent = true }
--     vim.keymap.set("n", "gs", ":TSLspOrganize<CR>", opts)
--     vim.keymap.set("n", "gi", ":TSLspRenameFile<CR>", opts)
--     vim.keymap.set("n", "go", ":TSLspImportAll<CR>", opts)
--
--     default_on_attach(client, bufnr)
--   end
-- }
-- servers["vuels"] = {}
-- servers["ansiblels"] = {}
-- servers["svelte"] = {}
-- servers["sumneko_lua"] = {
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = { 'vim' },
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }
--
-- servers["taplo"] = {}
-- servers["rust_analyzer"] = {}
--
-- local lspconfig = require("lspconfig")
--
-- -- LSPs
-- for server, config_overrides in pairs(servers) do
--
--   config_overrides = config_overrides or {}
--   local config = default_config()
--   for k, v in pairs(config_overrides) do
--     config[k] = v
--   end
--
--   lspconfig[server].setup(config)
-- end
-- setup_diagnostics()
