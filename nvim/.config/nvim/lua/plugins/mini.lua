-- lua/plugins/mini.lua

require("mini.fuzzy").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.git").setup()
require("mini.trailspace").setup()
require("mini.cursorword").setup()
require("mini.starter").setup()
require("mini.diff").setup()
require("mini.tabline").setup()
require("mini.notify").setup()
require('mini.bufremove').setup()

require("mini.completion").setup({
  mappings = {
    move_down  = '<C-j>',
    move_up    = '<C-k>',
  }
})
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

local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
  snippets = {
    -- Load custom file with global snippets first (adjust for Windows)
    -- gen_loader.from_file('~/.config/nvim/snippets/global.json'),

    -- Load snippets based on current language by reading files from
    -- "snippets/" subdirectories from 'runtimepath' directories.
    gen_loader.from_lang(),
  },
})
require("mini.snippets").start_lsp_server()

require("mini.hipatterns").setup({
  highlighters = {
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack  = { pattern = "%f[%w]()HACK()%f[%W]",  group = "MiniHipatternsHack"  },
    todo  = { pattern = "%f[%w]()TODO()%f[%W]",  group = "MiniHipatternsTodo"  },
    note  = { pattern = "%f[%w]()NOTE()%f[%W]",  group = "MiniHipatternsNote"  },
    hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
  },
})

require("mini.indentscope").setup({
  symbol = "│",
  draw = {
    -- priority = 5,
  },
})
require("mini.icons").setup({ style = "glyph" })
require("mini.statusline").setup()
