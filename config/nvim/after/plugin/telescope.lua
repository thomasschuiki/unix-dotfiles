require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules/.*",
      "secret.d/.*",
      "%.pem",
      ".git/.*",
    },
  },
})

local options = { noremap = true }
local builtin = require("telescope.builtin")

--- Keymaps
vim.keymap.set("n", "<leader>fg", builtin.git_files, options)
vim.keymap.set("n", "<leader>ff", builtin.find_files, options)
vim.keymap.set("n", "<leader>fs", builtin.live_grep, options)
vim.keymap.set("n", "<leader>fb", builtin.buffers, options)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, options)
