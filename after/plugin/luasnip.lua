local ls = require "luasnip"
ls.config.set_config{
	history = true,
	updateevents = "TextChanged,TextChangedI"
}
require("luasnip.loaders.from_vscode").lazy_load()
vim.keymap.set({ "i", "s" }, "<c-k>", function ()
	if ls.jumpable() then
		ls.jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function ()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-l>", function ()
	if ls.choice_active(-1) then
		ls.choice_active(1)
	end
end, { silent = true })

