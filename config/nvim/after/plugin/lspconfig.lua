require('nvim-lsp-installer').setup({})

local function default_on_attach(client, bufnr)
  -- require('completion').on_attach()

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<leader>dk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "<leader>dj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<leader>aw", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<leader>rw", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<leader>lw", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>rf", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "<leader>ll", "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    --hi LspReferenceRead cterm=bold ctermbg=red guibg=blue
    --hi LspReferenceText cterm=bold ctermbg=red guibg=blue
    --hi LspReferenceWrite cterm=bold ctermbg=red guibg=blue
    vim.api.nvim_exec(
      [[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]],
      false
    )
  end
end

local function setup_diagnostics()
  -- LSP Enable diagnostics
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = "»",
      spacing = 4,
    },
    underline = true,
    signs = true,
    update_in_insert = false,
  })

  vim.fn.sign_define("DiagnosticsSignError", { text = "", texthl = "DiagnosticsDefaultError" })
  vim.fn.sign_define("DiagnosticsSignWarn", { text = "", texthl = "DiagnosticsDefaultWarn" })
  vim.fn.sign_define("DiagnosticsSignInfo", { text = "", texthl = "DiagnosticsDefaultInfo" })
  vim.fn.sign_define("DiagnosticsSignHint", { text = "", texthl = "DiagnosticsDefaultHint" })

end

local function default_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  -- Add additional capabilities supported by nvim-cmp
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  -- Code actions
  capabilities.textDocument.codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
      codeActionKind = {
        valueSet = (function()
          local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
          table.sort(res)
          return res
        end)(),
      },
    },
  }

  return capabilities
end

local function default_config()
  return {
    capabilities = default_capabilities(),
    on_attach = default_on_attach
  }
end

local servers = {}
servers["gopls"] = {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  }
}
servers["yamlls"] = {}
servers["bashls"] = {}
servers["pylsp"] = {
  settings = {
    pylsp = {
      plugins = {
        black = {
          enabled = true,
        },
      },
    }
  }
}
servers["tsserver"] = {
  on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup({
      eslint_bin = "eslint_d",
      eslint_enable_diagnostics = true,
      eslint_enable_code_actions = true,
      enable_formatting = true,
      formatter = "prettier",
    })
    ts_utils.setup_client(client)

    local opts = { noremap = true, silent = true }
    buf_set_keymap("n", "gs", ":TSLspOrganize<CR>", opts)
    buf_set_keymap("n", "gi", ":TSLspRenameFile<CR>", opts)
    buf_set_keymap("n", "go", ":TSLspImportAll<CR>", opts)

    default_on_attach(client, bufnr)
  end
}
servers["vuels"] = {}
servers["ansiblels"] = {}
servers["svelte"] = {}
servers["sumneko_lua"] = {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

servers["taplo"] = {}
servers["rust_analyzer"] = {}

local lspconfig = require("lspconfig")

-- LSPs
for server, config_overrides in pairs(servers) do

  config_overrides = config_overrides or {}
  local config = default_config()
  for k, v in pairs(config_overrides) do
    config[k] = v
  end

  lspconfig[server].setup(config)
end
setup_diagnostics()
