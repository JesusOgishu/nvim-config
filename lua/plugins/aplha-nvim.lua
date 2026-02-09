return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[=================     ===============     ===============    ========  ========]],
      [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
      [[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
      [[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
      [[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
      [[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
      [[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
      [[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
      [[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
      [[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
      [[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
      [[||             .===' `===.         .==='.`===.         .===' /==.|  \/  |   ||]],
      [[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
      [[||      .=='    _-'    `-_  `='    _-'   `-_     `='  _-'   `-_  /| \/  |   ||]],
      [[||   .=='    _-'           '-__\._-'         '-_./__-'         `' |./|  |   ||]],
      [[||.=='    _-'                                                     `' |  /==.||]],
      [[=='    _-'                       N E O V I M                          \/   `==]],
      [[\    _-'                                                               `-_   /]],
      [[ `''                                                                       ``']],
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("p", "󰊄  Recent projects", ":Telescope projects<CR>"),
      dashboard.button("g", "󰊄  Live grep", ":Telescope live_grep<CR>"),
      dashboard.button("o", "󰉋  Open Folder", ":Telescope file_browser path=~ select_buffer=true<CR>"),
      dashboard.button("q", "󰩈  Quit", ":qa<CR>"),
    }

    alpha.setup(dashboard.config)
  end,
}
