local function set_augroups()
  local augroup = vim.api.nvim_create_augroup
  local autocmd = vim.api.nvim_create_autocmd

  autocmd('FileType markdown', {
    group = augroup('WrapInMarkdown', { clear = true }),
    command = 'setlocal wrap',
  })

  autocmd('TextYankPost', {
    group = augroup('YankGroup', { clear = true }),
    command = 'silent! lua vim.highlight.on_yank{higroup=\"IncSearch\", timeout=700}',
  })

  autocmd('BufWritePre', {
    group = augroup('OnSave', { clear = true }),
    callback = function()
      MiniTrailspace.trim()
    end,
  })
end

local function set_vim_g()
  vim.g.mapleader = " "
  -- netrw
  vim.g.netrw_browse_split = 0
  vim.g.netrw_banner = 0
  vim.g.netrw_winsize = 25
end

local function set_vim_o()
  local options = {
    backup         = false,
    errorbells     = false,
    expandtab      = true,
    hidden         = true,
    scrolloff      = 3,
    softtabstop    = 2,
    tabstop        = 2,
    shiftwidth     = 2,
    smartindent    = false,
    showmode       = false,
    termguicolors  = true,
    signcolumn     = 'yes',
    completeopt    = 'menuone,noselect',
    clipboard      = 'unnamedplus',
    swapfile       = false,
    undodir        = os.getenv("HOME") .. ".local/share/nvim/undodir",
    undofile       = true,
    incsearch      = true,
    number         = true,
    relativenumber = true,
    wrap           = false,
  }

  -- Generic vim.o
  for k, v in pairs(options) do
    vim.o[k] = v
  end

  -- Custom vim.o
  vim.o.shortmess = vim.o.shortmess .. 'c'

  -- Not yet in vim.o
  vim.cmd('set encoding=utf8')
  vim.cmd('set nowritebackup')
  vim.cmd('set secure')
  vim.cmd('set splitright')
  vim.cmd('set updatetime=100')
end

local function set_keymaps()
  local map = vim.keymap.set

  local options = { noremap = false, silent = true }

  -- Window navigation
  map('n', '<C-h>', '<C-w>h', options)
  map('n', '<C-j>', '<C-w>j', options)
  map('n', '<C-k>', '<C-w>k', options)
  --map('n', '<C-l>', '<C-w>l', options)

  map('n', '<leader>le', ':Lex 30<cr>', options)

  -- switch lines easily
  --map('n', '<leader>h', '<CMD>wincmd h<CR>', options)
  map('n', '<leader>j', '<CMD>wincmd j<CR>', options)
  map('n', '<leader>k', '<CMD>wincmd k<CR>', options)
  --map('n', '<leader>l', '<CMD>wincmd l<CR>', options)

  -- jump in checklist
  map('', '<C-n>', '<CMD>cnext<CR>', options)
  map('', '<C-m>', '<CMD>cprevious<CR>', options)
  map('n', '<leader>a', '<CMD>cclose<CR>', options)

  -- move selection around
  map('v', '<A-j>', "<CMD>m '>+1<CR>gv=gv", options)
  map('v', '<A-k>', "<CMD>m '<-2<CR>gv=gv", options)
  map('i', '<C-j>', "<ESC><CMD>m .+1<CR>==", options)
  map('i', '<C-k>', "<ESC><CMD>m .-2<CR>==", options)
  map('n', '<leader>j', "<CMD>m .+1<CR>==", options)
  map('n', '<leader>k', "<CMD>m .-2<CR>==", options)

  -- indent lines
  map('v', '<', '<gv', options)
  map('v', '>', '>gv', options)

  -- add double quotes around a selection
  map('v', '"', '<ESC>`a"<ESC>`<i"<ESC>', options)

  -- hold on to yanked text
  --map('v', 'p', '"_dP', options)

  -- keep cursor centered while searching
  map('n', 'n', 'nzzzv', options)
  map('n', 'N', 'Nzzzv', options)
  map('n', 'J', 'mzJ`z', options)

  -- Copy to clipboard
  map('v', '<leader>y', '"+y', options)
  map('n', '<leader>y', '"+y', options)
  map('n', '<leader>Y', '"+yg_', options)
  map('n', '<leader>yy', '"+yy', options)

  -- Paste from clipboard
  map('n', '<leader>p', '"+p', options)
  map('n', '<leader>P', '"+P', options)
  map('v', '<leader>p', '"+p', options)
  map('v', '<leader>P', '"+P', options)
end

set_augroups()
set_vim_g()
set_vim_o()
set_keymaps()
