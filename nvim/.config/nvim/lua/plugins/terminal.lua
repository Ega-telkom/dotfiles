-- lua/plugins/terminal.lua

require('terminal').setup({
  layout = { open_cmd = 'botright new' },
  cmd = { vim.o.shell },
  autoclose = false,
})
