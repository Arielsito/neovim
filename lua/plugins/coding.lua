return {
	-- Smart renaming
	{
		"smjonas/inc-rename.nvim",
		event = "VeryLazy",
		opts = {},
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-mini/mini.nvim",
		},
		---@type 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},

	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = {
				enable = true,
				auto_trigger = true,
				keymap = {
					accept = "<C-l>",
					accept_word = "<M-l>",
					accept_line = "<M-S-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				["*"] = true,
				gitcommit = false,
				gitrebase = false,
				markdown = false,
				help = false,
			},
		},
	},
}
