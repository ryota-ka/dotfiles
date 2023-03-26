local function has_plugin(name)
  return vim.fn.has_key(vim.g.plugs, name) == 1
end

return has_plugin
