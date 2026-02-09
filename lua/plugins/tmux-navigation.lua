return {
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			local nav = require("nvim-tmux-navigation")

			nav.setup({
				disable_when_zoomed = true,
			})
		end,
	},
}
