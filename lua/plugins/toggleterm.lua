return {
	"akinsho/toggleterm.nvim",
	version = "*",

	keys = {
		{ "<space>op", "<cmd>ToggleTerm<cr>", desc = "Open floating terminal" },
		{ "<space>od", desc = "Toggle Laravel server" },
		{ "<space>of", desc = "Toggle Frontend dev server" },
	},

	config = function()
		require("toggleterm").setup({
			size = 20,

			open_mapping = [[<space>op]],

			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,

			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,

			persist_size = true,
			persist_mode = true,

			direction = "float",

			close_on_exit = false,

			shell = vim.o.shell,

			float_opts = {
				border = "rounded",
				width = function()
					return math.floor(vim.o.columns * 0.8)
				end,
				height = function()
					return math.floor(vim.o.lines * 0.8)
				end,
				winblend = 0,
			},
		})

		vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

		local Terminal = require("toggleterm.terminal").Terminal

		local backend = Terminal:new({
			cmd = "php artisan serve",
			direction = "float",
			hidden = true,
			close_on_exit = false,
		})

		vim.keymap.set("n", "<space>od", function()
			backend:toggle()
		end, { desc = "Toggle php artisan serve" })

		local frontend = Terminal:new({
			cmd = "npm run dev",
			direction = "float",
			hidden = true,
			close_on_exit = false,
		})

		vim.keymap.set("n", "<space>of", function()
			frontend:toggle()
		end, { desc = "Toggle npm run dev" })
	end,
}
