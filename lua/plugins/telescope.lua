return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					".git/",
					"dist",
					"build",
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		telescope.load_extension("ui-select")

		-- Find files
		vim.keymap.set("n", "<C-p>", function()
			builtin.find_files({
				hidden = true,
				no_ignore = true,
			})
		end, { desc = "Find files" })

		-- Live grep
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })

		-- Find in current file (tipo Ctrl+F)
		vim.keymap.set("n", "<leader>ff", function()
			builtin.current_buffer_fuzzy_find()
		end, { desc = "Find in current file" })
	end,
}
