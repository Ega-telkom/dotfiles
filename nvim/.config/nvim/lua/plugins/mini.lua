-- lua/plugins/mini.lua

require("mini.fuzzy").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.git").setup()
require("mini.trailspace").setup()
require("mini.cursorword").setup()
require("mini.diff").setup()
require("mini.notify").setup()
require('mini.bufremove').setup()
require("mini.sessions").setup()

local starter = require("mini.starter")
starter.setup({
  items = {
    starter.sections.sessions(10, true),
    starter.sections.recent_files(5, false, false)
  }
})

require("mini.completion").setup()

require("mini.files").setup({
  windows = {
    preview = true,
    width_focus = 50,
    width_nofocus = 15,
    width_preview = 50,
  }
})

require("mini.pick").setup({
  options = {
    -- Whether to cache matches (more speed and memory on repeated prompts)
    use_cache = true,
  },
  mappings = {
    move_down  = '<C-j>',
    move_up    = '<C-k>',
  }
})

require("mini.hipatterns").setup({
  highlighters = {
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack  = { pattern = "%f[%w]()HACK()%f[%W]",  group = "MiniHipatternsHack"  },
    todo  = { pattern = "%f[%w]()TODO()%f[%W]",  group = "MiniHipatternsTodo"  },
    note  = { pattern = "%f[%w]()NOTE()%f[%W]",  group = "MiniHipatternsNote"  },
    hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
  },
})

require("mini.icons").setup({ style = "ascii" })
require('mini.statusline').setup({
  use_icons = false,
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local git           = MiniStatusline.section_git({ trunc_width = 40 })
      local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 40 })
      local filename = MiniStatusline.section_filename({ trunc_width = 140, args = { 'short' } })

      local short_modes = {
        ['Normal']   = 'NOR', ['Insert']   = 'INS', ['Visual']   = 'VIS',
        ['V-Line']   = 'V-L', ['V-Block']  = 'V-B', ['Command']  = 'CMD',
        ['Replace']  = 'REP', ['Terminal'] = 'TER',
      }
      if short_modes[mode] then mode = short_modes[mode] end

      if git ~= '' then git = git:gsub('^Git%s+', '') end
      if diagnostics ~= '' then diagnostics = diagnostics:gsub('^Diag%s+', '') end

      local location = string.format('%d:%d', vim.fn.line('.'), vim.fn.col('.'))

      return MiniStatusline.combine_groups({
        { hl = mode_hl,                  strings = { mode } },
        { hl = 'MiniStatuslineDevinfo',  strings = { git, diagnostics } },
        '%<',
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=',
        { hl = mode_hl,                  strings = { location } },
      })
    end
  }
})
