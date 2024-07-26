local config = require("executable-checker.config")

local okay_func = function(exec_name)
	vim.health.ok(exec_name .. " is found in $PATH.")
end

local error_func = function(exec_name)
	vim.health.error(exec_name .. " is not installed!")
end

return {
	check = function()
		for package, executables in pairs(config.executables) do
			local package_name
			if package == "*" then
				package_name = "other executables"
			else
				package_name = package
			end

			vim.health.start(("Running executable checker for %s..."):format(package_name))
			for _, exec in pairs(executables) do
				if vim.fn.executable(exec) ~= 0 then
					okay_func(exec)
				else
					error_func(exec)
				end
			end
		end
	end,
}
