return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		---@type false | "classic" | "modern" | "helix"
		preset = "classic",
		spec = {},
		notify = true,
		triggers = {
			{ "<auto>", mode = "nxso" },
		},
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			spelling = {
				enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
			presets = {
				operators = true, -- adds help for operators like d, y, ...
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},
		win = {
			no_overlap = true,
			title = false,
			title_pos = "center",
			zindex = 1000,
			bo = {},
			wo = {
				winblend = 5, -- value between 0-100 0 for fully opaque and 100 for fully transparent
			},
		},
		layout = {
			width = { min = 20 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
		},
		keys = {
			scroll_down = "<c-j>", -- binding to scroll down inside the popup
			scroll_up = "<c-k>", -- binding to scroll up inside the popup
		},

		show_help = true, -- show a help message in the command line for using WhichKey
		show_keys = true, -- show the currently pressed key and its label as a message in the command line
		disable = {
			ft = { "TelescopePrompt" },
			bt = {},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
