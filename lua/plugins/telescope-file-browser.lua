return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		telescope.setup({
			extensions = {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					hidden = true,
					respect_gitignore = false,
					grouped = true,
					previewer = false,
					initial_mode = "normal",

					mappings = {
						["n"] = {
							["p"] = function(prompt_bufnr)
								local entry = action_state.get_selected_entry()
								local path = entry.path or entry.filename

								actions.close(prompt_bufnr)

								vim.cmd("cd " .. vim.fn.fnameescape(path))

								local buf = vim.api.nvim_get_current_buf()
								vim.cmd("bd! " .. buf)

								vim.cmd("enew")

								vim.cmd("Neotree show")
							end,
						},
					},
				},
			},
		})

		telescope.load_extension("file_browser")

		vim.keymap.set("n", "<leader>of", function()
			telescope.extensions.file_browser.file_browser({
				path = vim.loop.cwd(),
				select_buffer = true,
			})
		end, { desc = "Open Folder" })
	end,
}
