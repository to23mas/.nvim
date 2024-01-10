local zen = require("zen-mode")
vim.keymap.set("n", "<leader>tz",
	function()
		zen.toggle({
			window = {
				width = .45
			}
		})
	end
)
