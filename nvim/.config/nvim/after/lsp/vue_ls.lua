return {
  cmd = { 'vue-language-server', '--stdio' },
  filetypes = { 'vue' },
  root_markers = { 'package.json', '.git' },
  on_init = function(client)
    client.handlers['tsserver/request'] = function(_, result, ctx)
      local ts = vim.lsp.get_clients({ bufnr = ctx.bufnr, name = 'ts_ls' })[1]
      if not ts then return end
      local id, command, payload = unpack(result[1])
      ts:exec_cmd({
        title = 'vue_forward',
        command = 'typescript.tsserverRequest',
        arguments = { command, payload },
      }, { bufnr = ctx.bufnr }, function(_, r)
        client:notify('tsserver/response', { { id, r and r.body } })
      end)
    end
  end,
}
