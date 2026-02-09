return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			detection_methods = { "lsp", "pattern" },

			patterns = {
				".git",
				"package.json",
				"composer.json",
				"pyproject.toml",
				"Makefile",
			},

			show_hidden = false,
			silent_chdir = true,
		})
	end,
}
