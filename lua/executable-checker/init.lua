local config = require("executable-checker.config")

---@param exec string | string[]
---@param package_name string | nil
local add_exec = function(exec, package_name)
	if type(exec) == "string" then
		exec = { exec }
	end

	if type(package_name) == "string" then
		config.executables[package_name] = config.executables[package_name] or {}
		vim.list_extend(config.executables[package_name], exec)
	else
		config.executables["*"] = config.executables["*"] or {}
		vim.list_extend(config.executables["*"], exec)
	end
end

return {
	---@param opts? ExecutableCheckerConfig
	setup = function(opts)
		opts = opts or { executables = {} }
		opts.executables = opts.executables or {}
		for k, v in pairs(opts.executables) do
			local package
			if type(k) == "string" then
				package = k
			else
				package = nil
			end
			add_exec(v, package)
		end
	end,
	add_executable = add_exec,
}
