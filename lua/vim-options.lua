-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Clipboard
vim.opt.clipboard = "unnamedplus"

vim.g.blade_custom_directives = { "livewire", "endlivewire" }
vim.g.blade_indent_rules = 1
vim.api.nvim_create_autocmd("FileType", {
	pattern = "blade",
	callback = function()
		vim.opt_local.syntax = "on"
	end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.blade.php",
	callback = function()
		vim.bo.filetype = "html"
	end,
})
vim.o.foldenable = false
vim.o.foldmethod = "manual"
