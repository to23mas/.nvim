local addHighlightedToTranslations = function()
  -- Get the start and end positions of the highlighted text
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  -- Extract the lines of the highlighted text
  local lines = vim.fn.getline(start_pos[2], end_pos[2])

  -- If the range is within the same line, trim the text
  if #lines == 1 then
    lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
  else
    lines[1] = string.sub(lines[1], start_pos[3])
    lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
  end

  local highlighted_text = table.concat(lines, '\n')

  -- Print the highlighted text for validation
  print("Highlighted text: " .. highlighted_text)
end

-- Command (works in normal mode, but only prints currently visually selected text)
vim.api.nvim_create_user_command("Oscar18", addHighlightedToTranslations, {})

-- Keymap for visual mode
vim.keymap.set('v', '<space>tr', addHighlightedToTranslations, { noremap = true, silent = true })

