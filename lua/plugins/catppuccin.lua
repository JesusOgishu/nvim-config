-- Theme
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
        },
      },
      custom_highlights = function(colors)
        return {
          Comment = { fg = colors.overlay1, style = { "italic" } },
          htmlComment = { fg = colors.overlay1, style = { "italic" } },
        }
      end,

    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
