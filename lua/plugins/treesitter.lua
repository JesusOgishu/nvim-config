return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	event = { "BufReadPost", "BufNewFile" },

	dependencies = {
		"windwp/nvim-ts-autotag",
	},

	config = function()
		local ok, configs = pcall(require, "nvim-treesitter.configs")
		if not ok then
			return
		end

		configs.setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"bash",
				"javascript",
				"html",
				"css",
				"json",
				"php",
				"blade",
			},

			auto_install = true,

			highlight = {
				enable = true,
			},

			indent = {
				enable = true,
			},

			autotag = {
				enable = true,
			},
		})
	end,
}
