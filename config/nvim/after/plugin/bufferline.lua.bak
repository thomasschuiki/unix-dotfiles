local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local bufferline = require('bufferline')

-- Move to previous/next
map('n', '<A-,>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<A-.>', ':BufferLineCycleNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferLineMovePrevious<CR>', opts)
map('n', '<A->>', ' :BufferLineMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferLineGoToBuffer 1<CR>', opts)
map('n', '<A-2>', ':BufferLineGoToBuffer 2<CR>', opts)
map('n', '<A-3>', ':BufferLineGoToBuffer 3<CR>', opts)
map('n', '<A-4>', ':BufferLineGoToBuffer 4<CR>', opts)
map('n', '<A-5>', ':BufferLineGoToBuffer 5<CR>', opts)
map('n', '<A-6>', ':BufferLineGoToBuffer 6<CR>', opts)
map('n', '<A-7>', ':BufferLineGoToBuffer 7<CR>', opts)
map('n', '<A-8>', ':BufferLineGoToBuffer 8<CR>', opts)
map('n', '<A-9>', ':BufferLineGoToBuffer 9<CR>', opts)
map('n', '<A-0>', ':BufferLineGoToBuffer -1<CR>', opts)
-- Close buffer
map('n', '<A-c>', ':bdelete<CR>', opts)
-- Sort automatically by...
map('n', '<Space>be', ':BufferLineSortByExtension<CR>', opts)
map('n', '<Space>bd', ':BufferLineSortByDirectory<CR>', opts)
map('n', '<Space>bt', ':BufferLineSortByTabs<CR>', opts)

map('n', 'gb', ':BufferLinePick<CR>', opts)

local options = {
  diagnostics = "nvim_lsp",
  numbers = "ordinal",
}

bufferline.setup{ options=options }

-- Buffer Colors
-- local colors = require("gruvbox-baby.colors").config()
-- vim.api.nvim_set_hl(0, 'BufferInactiveIndex', { fg = colors.comment })
-- vim.api.nvim_set_hl(0, 'BufferInactiveSign', { fg = colors.comment })
-- vim.api.nvim_set_hl(0, 'BufferCurrentMod', { fg = colors.foreground })
