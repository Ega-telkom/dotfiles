-- lua/autocmds.lua

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    MiniTrailspace.trim()
  end
})

-- Status column
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
	 callback = function()
		  vim.o.statuscolumn = "%!v:lua.StatusColumn()"

		  function _G.StatusColumn()
		  local s = " "
		  -- Signs
		  s = s .. "%s"
		  -- Spacing
		  s = s .. "%="
		  -- Line number
		  if vim.v.virtnum < 0 then
		  s = s .. " "
		  else
		  s = s .. (vim.v.relnum > 0 and vim.v.relnum or vim.v.lnum)
		  end
		  -- Separator
		  s = s .. (vim.v.virtnum < 0 and "│" or "│")
		  return s
		  end
  end,
})

-- Configure Lua LSP to work with nvim configs
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    require("lazydev").setup()
  end,
})
