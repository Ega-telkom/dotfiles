-- lua/plugins/mini.lua

require("mini.fuzzy").setup()
require("mini.completion").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.git").setup()
require("mini.files").setup()
require("mini.trailspace").setup()
require("mini.cursorword").setup()
require("mini.starter").setup()
require("mini.diff").setup()
require("mini.tabline").setup()

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
require("mini.indentscope").setup({ symbol = "│" })
require("mini.statusline").setup({ use_icons = false })
