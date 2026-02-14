-- lua/autocmds.lua

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    MiniTrailspace.trim()
  end
})

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
    vim.wo.statuscolumn = (bt ~= "" or ft == "ministarter" or ft == "NvimTree") and "" or "%!v:lua.StatusColumn()"
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.wo.scrolloff = 0
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.fn.mkdir(vim.fn.expand('<afile>:p:h'), 'p')
  end,
})

local make_stop = function()
  local au_opts = { pattern = '*:n', once = true }
  au_opts.callback = function()
    while MiniSnippets.session.get() do
      MiniSnippets.session.stop()
    end
  end
  vim.api.nvim_create_autocmd('ModeChanged', au_opts)
end
local opts = { pattern = 'MiniSnippetsSessionStart', callback = make_stop }
vim.api.nvim_create_autocmd('User', opts)

vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()

    if vim.fn.argc() == 0 and vim.fn.bufnr('$') == 1 then
      return
    end

    local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    MiniSessions.write(cwd)

    local session_dir = vim.fn.stdpath('data') .. '/session'
    local sessions = vim.fn.readdir(session_dir)

    if #sessions > 15 then
      table.sort(sessions, function(a, b)
        local a_time = vim.fn.getftime(session_dir .. '/' .. a)
        local b_time = vim.fn.getftime(session_dir .. '/' .. b)
        return a_time < b_time
      end)

      for i = 1, #sessions - 15 do
        vim.fn.delete(session_dir .. '/' .. sessions[i])
      end
    end
  end
})
