local state = {
	floating = {
		buf = -1,
		win = -1,
	}
}

local function create_floating_window(opts)
	local ui = vim.api.nvim_list_uis()[1] -- Get UI dimensions
	if not ui then
		print("No UI available!")
		return
	end

	opts = opts or {}

	local width = math.floor(ui.width * 0.8)
	local height = math.floor(ui.height * 0.8)
	local row = math.floor((ui.height - height) / 2)
	local col = math.floor((ui.width - width) / 2)

	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win_config = {
		relative = 'editor',
		width = width,
		height = height,
		row = row,
		col = col,
		style = 'minimal',
		border = 'single',
	}

	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }
end

vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')
local toggle_term = function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= 'terminal' then
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

-- vim.api.nvim_create_user_command("Floaterminal", toggle_term, {})
vim.keymap.set({ 't', 'n' }, '<space>te', toggle_term)
