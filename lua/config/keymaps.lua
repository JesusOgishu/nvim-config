local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local nav = require("nvim-tmux-navigation")

-- Neo-tree
keymap("n", "<leader>n", ":Neotree filesystem reveal left<CR>", vim.tbl_extend("force", opts, { desc = "Neo-tree" }))

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<CR>", vim.tbl_extend("force", opts, { desc = "Find files" }))

keymap("n", "<leader>fg", ":Telescope live_grep<CR>", vim.tbl_extend("force", opts, { desc = "Live grep" }))
vim.keymap.set("n", "<A-d>", "yyp", { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", nav.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", nav.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", nav.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", nav.NvimTmuxNavigateRight)
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "Nuevo tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Cerrar tab" })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Cerrar todos menos este" })
vim.keymap.set("n", "<leader>tl", "gt", { desc = "Tab siguiente" })
vim.keymap.set("n", "<leader>th", "gT", { desc = "Tab anterior" })
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
