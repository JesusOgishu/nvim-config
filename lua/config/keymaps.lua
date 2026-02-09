local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local nav = require("nvim-tmux-navigation")

-- Neo-tree
keymap(
  "n",
  "<leader>n",
  ":Neotree filesystem reveal left<CR>",
  vim.tbl_extend("force", opts, { desc = "Neo-tree" })
)

-- Telescope
keymap(
  "n",
  "<C-p>",
  ":Telescope find_files<CR>",
  vim.tbl_extend("force", opts, { desc = "Find files" })
)

keymap(
  "n",
  "<leader>fg",
  ":Telescope live_grep<CR>",
  vim.tbl_extend("force", opts, { desc = "Live grep" })
)
vim.keymap.set('n', '<A-d>', 'yyp', { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", nav.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", nav.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", nav.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", nav.NvimTmuxNavigateRight)
