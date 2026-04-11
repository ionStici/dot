-- [[ Diagnostic Config ]]
vim.diagnostic.config {
  virtual_text = { enabled = true, spacing = 4, prefix = '●' },
  virtual_lines = false,
  signs = true,
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many', header = '', prefix = '' },
  jump = { float = true },
}
local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end
