local function set_augroup()
  vim.api.nvim_command("augroup WrapInMarkdown")
  vim.api.nvim_command("autocmd!")
  vim.api.nvim_command("autocmd FileType markdown setlocal wrap")
  vim.api.nvim_command("augroup END")

  vim.api.nvim_command("augroup highlight_yank")
  vim.api.nvim_command("autocmd!")
  vim.api.nvim_command("au TextYankPost * silent! lua vim.highlight.on_yank{higroup=\"IncSearch\", timeout=700}")
  vim.api.nvim_command("augroup END")
end

local function set_vim_g()
  vim.g.mapleader = " "
end

local function set_vim_o()
  local options = {
    backup        = false,
    errorbells    = false,
    expandtab     = true,
    hidden        = true,
    scrolloff     = 3,
    softtabstop   = 2,
    tabstop       = 2,
    shiftwidth    = 2,
    smartindent   = false,
    showmode      = false,
    termguicolors = true,
    signcolumn    = 'yes',
    completeopt   = 'menuone,noselect',
    clipboard     = 'unnamedplus'
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
  vim.cmd('set updatetime=300')
end

local function set_vim_wo()
  vim.wo.number = true
  vim.wo.relativenumber = true
  vim.wo.wrap = false
end

local function set_keymaps()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = false, silent = true }

  -- Window navigation
  map('n', '<C-h>', '<C-w>h', options)
  map('n', '<C-j>', '<C-w>j', options)
  map('n', '<C-k>', '<C-w>k', options)
  map('n', '<C-l>', '<C-w>l', options)

  map('n', '<leader>le', ':Lex 30<cr>', options)

  -- switch lines easily
  map('n', '<leader>h', '<CMD>wincmd h<CR>', options)
  map('n', '<leader>j', '<CMD>wincmd j<CR>', options)
  map('n', '<leader>k', '<CMD>wincmd k<CR>', options)
  map('n', '<leader>l', '<CMD>wincmd l<CR>', options)

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
  map('v', 'p', '"_dP', options)

  -- keep cursor centered while searching
  map('n', 'n', 'nzzzv', options)
  map('n', 'N', 'Nzzzv', options)
  map('n', 'J', 'mzJ`z', options)

end

local function init()
  set_augroup()
  set_vim_g()
  set_vim_o()
  set_vim_wo()
  set_keymaps()
end

return {
  init = init
}
