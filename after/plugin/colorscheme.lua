require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},

	transparent_background = false,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = false,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.15,
	},

	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {"italic"},
		functions = {"italic"},
		keywords = {"italic"},
		strings = {},
		variables = {"italic"},
		numbers = {},
		booleans = {},
		properties = {"italic"},
		types = {"italic"},
		operators = {"italic"},
	},

	color_overrides = {
		all = {
			comments = '#ffa5a5',
		}
	},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = false,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- require('rose-pine').setup({
-- 	variant = 'auto',
-- 	dark_variant = 'main',
-- 	bold_vert_split = false,
-- 	dim_nc_background = false,
-- 	disable_background = false,
-- 	disable_float_background = false,
-- 	disable_italics = false,
--
-- 	groups = {
-- 		background = 'base',
-- 		background_nc = '_experimental_nc',
-- 		panel = 'surface',
-- 		panel_nc = 'base',
-- 		border = 'highlight_med',
-- 		comment = 'muted',
-- 		link = 'iris',
-- 		punctuation = 'subtle',
--
-- 		error = 'love',
-- 		hint = 'iris',
-- 		info = 'foam',
-- 		warn = 'gold',
--
-- 		headings = {
-- 			h1 = 'iris',
-- 			h2 = 'foam',
-- 			h3 = 'rose',
-- 			h4 = 'gold',
-- 			h5 = 'pine',
-- 			h6 = 'foam',
-- 		}
-- 		-- or set all headings at once
-- 		-- headings = 'subtle'
-- 	},
--
-- 	-- Change specific vim highlight groups
-- 	-- https://github.com/rose-pine/neovim/wiki/Recipes
-- 	highlight_groups = {
-- 		ColorColumn = { bg = 'rose' },
--
-- 		-- Blend colours against the "base" background
-- 		CursorLine = { bg = 'foam', blend = 10 },
-- 		StatusLine = { fg = 'love', bg = 'love', blend = 10 },
--
-- 		-- By default each group adds to the existing config.
-- 		-- If you only want to set what is written in this config exactly,
-- 		-- you can set the inherit option:
-- 		Search = { bg = 'gold', inherit = false },
-- 	}
-- })

require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = { italic = true },
    keywordStyle = { italic = true},
    statementStyle = { italic = true },
    typeStyle = { italic = true },
    transparent = false,        -- do not set background color
    dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
-- vim.cmd("colorscheme ayu-mirage")
vim.cmd.colorscheme'rose-pine'
-- vim.cmd.highlight('LineNr guifg=#bfa867')

