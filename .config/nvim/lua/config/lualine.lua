-- Edit of: Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

local colors = {
  bg0_hard   = "#1d2021",
  bg0        = "#282828",
  bg1        = "#32302f",
  bg2        = "#3c3836",
  bg3        = "#504945",
  bg4	     = "#7c6f64",

  gray         = "#665c54",
  fg0          = "#fbf1c7",
  fg1          = "#ebdbb2",
  fg2          = "#d5c4a1",
  fg3          = "#bdae93",
  fg4          = "#a89984",

  red0	       = "#fb4934",
  green0       = "#b8bb26",
  yellow0      = "#fabd2f",
  blue0        = "#83a598",
  purple0      = "#d3869b",
  aqua0        = "#8ec07c",
  orange0      = "#fe8019",
  red1          = "#cc241d",
  green1        = "#98971a",
  yellow1       = "#d79921",
  blue1         = "#458588",
  purple1       = "#b16286",
  aqua1         = "#689d6a",
  orange1       = "#d65d0e",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local config = {
  options = {
    component_separators = '',
    section_separators = '',
    theme = {
      normal = { c = { fg = colors.fg1, bg = colors.bg0 } },
      inactive = { c = { fg = colors.fg1, bg = colors.bg0} },
    },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue0 },
  padding = { left = 0, right = 1 },
}

ins_left {
  function()
    local mode = vim.fn.mode()
    local mode_name = {
      n = 'NORMAL',
      i = 'INSERT',
      v = 'VISUAL',
      [''] = 'VISUAL BLOCK',
      V = 'VISUAL LINE',
      c = 'COMMAND',
      R = 'REPLACE',
      s = 'SELECT',
      S = 'SELECT LINE',
      [''] = 'SELECT BLOCK',
    }
    return mode_name[mode] or mode:upper()
  end,
  color = { fg = colors.blue0 },
  padding = { right = 1 },
}

ins_left {
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.blue0, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.blue0, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    error = { fg = colors.red1 },
    warn = { fg = colors.yellow0 },
    info = { fg = colors.blue0 },
  },
}

ins_right {
  'o:encoding',
  fmt = string.upper,
  cond = conditions.hide_in_width,
  color = { fg = colors.blue0, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false,
  color = { fg = colors.blue0, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.blue0, gui = 'bold' },
}

ins_right {
  'diff',
  symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green0 },
    modified = { fg = colors.orange0 },
    removed = { fg = colors.blue0 },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.blue0 },
  padding = { left = 1 },
}

lualine.setup(config)
