require('mini.comment').setup({})
require('mini.surround').setup({})
require('mini.trailspace').setup({})
require('mini.statusline').setup({})
require('mini.tabline').setup({})

local map = vim.keymap.set
local opts = { noremap = false, silent = true }

-- Tabline Keymap
-- Move to previous/next
opts["desc"] = "previous buffer"
map('n', '<A-,>', ':bprevious<CR>', opts)
opts["desc"] = "next buffer"
map('n', '<A-.>', ':bnext<CR>', opts)
-- Close buffer
opts["desc"] = "close buffer"
map('n', '<A-c>', ':bdelete<CR>', opts)
