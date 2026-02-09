return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	cmd = "Neotree",

	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,

			window = {
				position = "left",
				width = 30,
			},

			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				hijack_netrw_behavior = "open_default",
			},
		})

		-- open neotree
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				vim.cmd("Neotree")
			end,
		})
	end,
}
