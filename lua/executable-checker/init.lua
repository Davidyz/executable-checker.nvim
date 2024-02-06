local config = require("executable-checker.config")
return {
  setup = function(opts)
    opts = opts or {}
    if type(opts.executables) == "table" then
      vim.list_extend(config.executables, opts.executables)
    end
  end,
  add_executable = function(exec)
    if type(exec) == "string" then
      vim.list_extend(config.executables, { exec })
    elseif type(exec) == "table" then
      vim.list_extend(config.executables, exec)
    end
  end,
}
