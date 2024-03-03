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

local opts = { noremap = true }
local builtin = require("telescope.builtin")

--- Keymaps
opts["desc"] = "search in git files"
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
opts["desc"] = "find in files"
vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
opts["desc"] = "live grep files"
vim.keymap.set("n", "<leader>fs", builtin.live_grep, opts)
opts["desc"] = "search buffers"
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
opts["desc"] = "search help tags"
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
