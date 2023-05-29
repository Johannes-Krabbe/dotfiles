local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local fortune = require("alpha.fortune")

local header = {
  [[                                                                   ]],
  [[      ████ ██████           █████      ██                    ]],
  [[     ███████████             █████                            ]],
  [[     █████████ ███████████████████ ███   ███████████  ]],
  [[    █████████  ███    █████████████ █████ ██████████████  ]],
  [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
  [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
  [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
}

local header_colors = {
  "#1C506B",
  "#1D5D68",
  "#1E6965",
  "#1F7562",
  "#21825F",
  "#228E5C",
  "#239B59",
  "#24A755",
}

for i, color in pairs(header_colors) do
  vim.api.nvim_set_hl(0, 'StartLogo' .. i, { fg = color })
end

local function colorize_header()
  local lines = {}

  for i, chars in pairs(header) do
    local line = {
      type = "text",
      val = chars,
      opts = {
        hl = "StartLogo" .. i,
        shrink_margin = false,
        position = "center",
      },
    }

    table.insert(lines, line)
  end

  return lines
end

dashboard.section.buttons.val = {
  dashboard.button("p", "  Open Project", ":Telescope projects<CR>", {}),
  dashboard.button("e", "  New file", ":ene | startinsert <CR>", {}),
  dashboard.button("f", "  Find file", ":Telescope find_files<CR>", {}),
  dashboard.button("g", "  Find word", ":Telescope live_grep<CR>", {}),
  dashboard.button("q", "  Quit NVIM", ":qa<CR>", {}),
}

dashboard.section.footer.val = table.concat(fortune(), '\n')

alpha.setup({
  layout = {
    { type = "padding", val = 14 },
    { type = "group", val = colorize_header() },
    { type = "padding", val = 8 },
    dashboard.section.buttons,
    dashboard.section.footer,
  },
  opts = { margin = 5 },
})
