return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			ui = {
				border = "rounded",
				notification_style = "plugin",
			},
			decorations = {
				statusline = {
					app_version = true,
					device = true,
				},
			},
			lsp = {
				color = {
					enabled = true,
					background = false,
					foreground = false,
					virtual_text = true,
				},
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
				},
				on_attach = function(client, bufnr) end,
			},
		})
	end,

	keys = {
		{ "<leader>fs", "<cmd>FlutterRun<cr>", desc = "Flutter Run (Start)" },
		{ "<leader>fq", "<cmd>FlutterQuit<cr>", desc = "Flutter Quit" },
		{ "<leader>fr", "<cmd>FlutterReload<cr>", desc = "Flutter Hot Reload" },
		{ "<leader>fR", "<cmd>FlutterRestart<cr>", desc = "Flutter Hot Restart" },
		{ "<leader>fe", "<cmd>FlutterEmulators<cr>", desc = "Flutter Emulators" },
		{ "<leader>fd", "<cmd>FlutterDevices<cr>", desc = "Flutter Devices" },
	},
}
