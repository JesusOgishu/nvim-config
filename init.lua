vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Leader
vim.g.mapleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup("plugins")

-- Options
require("vim-options")

-- Keymaps
require("config.keymaps")
-- Desactivar completamente el mouse
vim.opt.mouse = ""

-- Ocultar el cursor en todos los modos
vim.opt.guicursor = ""
-- Deshabilitar scroll accidental
vim.keymap.set("", "<ScrollWheelUp>", "<Nop>")
vim.keymap.set("", "<ScrollWheelDown>", "<Nop>")
vim.keymap.set("", "<ScrollWheelLeft>", "<Nop>")
vim.keymap.set("", "<ScrollWheelRight>", "<Nop>")
