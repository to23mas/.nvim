local function execute_php_code()
	local start_line = vim.fn.line("'<") - 1
	local end_line = vim.fn.line("'>")

	local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)
	local php_code = table.concat(lines, " "):gsub('"', '\\"')

	local result = vim.fn.system("php -r '" .. php_code .. "'")
	print(result)
end

vim.api.nvim_create_user_command("Php", execute_php_code, {range = true})
