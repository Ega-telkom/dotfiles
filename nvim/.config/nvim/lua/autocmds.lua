-- lua/autocmds.lua

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    MiniTrailspace.trim()
  end
})

-- Status column
function _G.StatusColumn()
  local s = " %s%="
  s = s .. (vim.v.virtnum < 0 and " " or (vim.v.relnum > 0 and vim.v.relnum or vim.v.lnum))
  s = s .. "│"
  return s
end

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "TermOpen" }, {
  callback = function()
    local ft = vim.bo.filetype
    local bt = vim.bo.buftype
    vim.wo.statuscolumn = (ft == "ministarter" or bt == "terminal") and "" or "%!v:lua.StatusColumn()"
  end,
})

-- Disable Scrolloff on term
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.wo.scrolloff = 0
  end,
})

-- Treesitter
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- Configure Lua LSP to work with nvim configs
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    require("lazydev").setup()
  end,
})
