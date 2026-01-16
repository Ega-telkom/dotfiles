-- lua/autocmds.lua

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    MiniTrailspace.trim()
  end
})

vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    local has_diag = #vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 }) > 0

    if has_diag then
      vim.diagnostic.open_float(nil, { focus = false })
    else
      vim.lsp.buf.hover()
    end
  end
})
vim.o.updatetime = 500
