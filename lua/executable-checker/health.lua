local config = require("executable-checker.config")

local okay_func = function(exec_name)
  vim.health.report_ok(exec_name .. " is found in $PATH.")
end

local error_func = function(exec_name)
  vim.health.report_error(exec_name .. " is not installed !!!")
end

return {
  check = function()
    vim.health.report_start("Running executable checker...")
    for _, executable in ipairs(config.executables) do
      if type(executable) == "string" then
        if vim.fn.executable(executable) ~= 0 then
          okay_func(executable)
        else
          error_func(executable)
        end
      end
    end
  end,
}
