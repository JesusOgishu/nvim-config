return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},

	config = function()
		local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		if ok_cmp then
			capabilities = cmp.default_capabilities(capabilities)
		end

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

			widget_guides = {
				enabled = true,
			},

			dev_log = {
				enabled = true,
				notify_errors = true,
				open_cmd = "tabedit",
			},

			outline = {
				open_cmd = "30vnew",
				auto_open = false,
			},

			lsp = {
				capabilities = capabilities,
				color = {
					enabled = true,
					background = false,
					foreground = false,
					virtual_text = true,
				},
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					analysisExcludedFolders = {},
				},
				on_attach = function(client, bufnr)
					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
					end
					map("n", "K", vim.lsp.buf.hover, "LSP Hover")
					map("n", "gd", vim.lsp.buf.definition, "Ir a definición")
					map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Acción de código")
				end,

				on_init = function(client, _)
					client.server_capabilities.documentFormattingProvider = true
				end,
			},

			dev_tools = {
				autostart = false,
				auto_open_browser = false,
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
		{ "<leader>fo", "<cmd>FlutterOutlineToggle<cr>", desc = "Flutter Outline" },
		{ "<leader>fl", "<cmd>FlutterLogClear<cr>", desc = "Flutter Clear Log" },
	},
}
