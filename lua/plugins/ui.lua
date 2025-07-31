return {
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})

			local focused = true
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					focused = true
				end,
			})
			vim.api.nvim_create_autocmd("FocusLost", {
				callback = function()
					focused = false
				end,
			})

			table.insert(opts.routes, 1, {
				filter = {
					cond = function()
						return not focused
					end,
				},
				view = "notify_send",
				opts = { stop = false },
			})

			opts.commands = {
				all = {
					-- options for the message history that you get with :Noice
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					vim.schedule(function()
						require("noice.text.markdown").keys(event.buf)
					end)
				end,
			})

			opts.presets.lsp_doc_border = true
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
		},
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous tab" },
		},
		opts = {
			options = {
				mode = "tabs",
				-- separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},

	-- filename
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local colors = require("pywal.core").get_colors()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = colors.background, guifg = colors.foreground },
						InclineNormalNC = { guibg = colors.color4, guifg = colors.color0 },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				-- hide = {
				-- 	cursorLine = false,
				-- },
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				theme = "pywal-nvim",
				component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "Outline" },
			},

			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = "", right = "" },
						icon = "󰣇",
					},
				},
				lualine_b = {
					{
						"filetype",
						icons_only = true,
						padding = { left = 1, right = 0 },
					},
					"filename",
				},
				lualine_c = {
					{
						"branch",
						icon = "",
					},
					{
						"diff",
						colored = true,
						symbols = { added = " ", modified = " ", removed = " " },
					},
				},
				lualine_x = {
					{
						"diagnostics",
						symbols = { error = " ", warning = " ", info = " ", hint = " " },
						update_in_insert = true,
					},
				},
				lualine_y = {
					{
						function()
							local bufnr = vim.api.nvim_get_current_buf()

							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return ""
							end

							local c = {}
							for _, client in pairs(clients) do
								table.insert(c, client.name)
							end
							return " " .. table.concat(c, " | ")
						end,
					},
				},
				lualine_z = {
					{ "location", separator = { left = "", right = "" }, icon = "" },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = { "" },
				lualine_c = { "" },
				lualine_x = { "" },
				lualine_y = { "" },
				lualine_z = { "location" },
			},
		},
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = false,
	},

	{
		"catppuccin",
		enabled = false,
	},

	{
		"tokyonight.nvim",
		enabled = false,
	},

	-- Vim-Tmux Navigator
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateRight",
			"TmuxNavigateUp",
			"TmuxNavigateDown",
			"TmuxNavigatePrevious",
			"TmuxNavigateProcessList",
		},

		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	-- snacks
	{
		"folke/snacks.nvim",
		opts = {
			scroll = { enabled = false },
			dashboard = {
				preset = {
					header = [[
					       ⡐⢀⠢⡡⢂⠠⠀⠂⢀⠀⡀⠀⠠⠀⠀⠄⠀⠄⠠⠐⡀⢂⢂⢂⠢⠡⡂⡃⠂⡐⠄⢂⠂⡂⠢⡑⡀⡂⠢⡂⡂⢂⠐⡐⠀⠄⠂⠀⠀⡀
					       ⠄⠐⡨⠰⡐⠠⠀⠂⠀⠄⠀⠐⠈⠄⠂⠐⡈⠐⠈⠠⠐⠄⠅⡐⠌⠪⡐⠄⠕⠨⢈⠄⡊⠨⡈⡐⢔⠨⠨⡀⡂⠅⢂⠂⡁⢁⠠⠈⠀⠄
					       ⠂⠐⠨⡁⡂⡂⠀⠐⠈⠀⠂⠁⡈⠀⡀⠂⠀⠌⠄⢁⠄⠅⡑⢨⠨⢊⠌⢌⠐⡁⢂⢂⠌⡂⠌⠔⡐⠡⡁⡂⠄⡑⢀⠐⠀⠂⠀⢀⠀⠂
					       ⠈⡀⠡⠨⢐⠠⠐⠀⠐⠈⠠⠀⢂⠀⠄⠈⠀⢂⠡⠀⠄⢂⢊⢐⠌⢆⢑⢐⠐⡈⠠⡀⠢⠐⠨⡐⠌⡊⢔⠀⡂⡂⠄⠠⠁⡈⠀⠄⠀⠐
					       ⢁⠀⠄⡁⠢⠐⠀⠠⠐⠀⠐⢀⠂⠀⠄⢀⠁⠠⢀⠂⢁⠐⡐⡐⠨⢂⠪⠀⡐⠠⢁⠐⠨⡈⢂⠔⡁⡊⠄⠂⡂⠄⠂⠨⠀⠄⠀⠄⠂⠠
					       ⡂⢀⠀⢂⠡⠐⠀⠂⠀⠀⠁⠠⠐⠀⠁⢀⠐⠈⢀⠐⠀⠄⡑⡈⢌⠆⠅⠡⢀⠅⠂⠨⠨⠐⡀⡂⡊⠆⠅⠡⠐⠐⢈⠠⠁⠂⠁⢀⠐⠀
					       ⡪⠀⠀⢂⠂⠅⠀⡀⠈⠀⠁⠡⠐⠈⢀⠂⢀⠅⠠⠀⠅⠂⠢⡘⡐⠌⠌⠂⡁⢀⠁⠅⠊⠄⢂⢐⠌⢌⠌⡀⠅⠌⠠⠐⡈⢀⠐⠀⠠⠀
					       ⠆⡁⠈⠄⢅⠡⠀⢀⠀⠁⡈⢀⣐⣬⡲⡮⡲⣕⢬⡰⡠⡡⠡⡂⡪⠨⠨⠠⠐⠠⡈⠄⠅⠊⠄⢂⠅⢅⠢⢀⠂⡁⠌⢀⠂⠄⠀⠠⠐⠀
					       ⠡⡀⠐⡨⢂⠐⠀⠀⡤⡕⣖⣵⣳⡳⣝⢮⡫⡮⡺⡸⡜⡜⣜⡐⡌⠌⡂⠄⡁⠢⠐⢈⠄⡑⠨⡐⢌⢐⢈⠀⡂⠄⠂⡀⢂⠁⠀⠂⠀⠐
					       ⡁⡂⢐⠨⠀⠂⡈⢀⠈⡙⡺⣼⣺⢝⣎⢝⢜⠝⡮⡑⡵⡱⡕⣎⢦⢱⢮⣺⡢⡧⣌⢄⡂⡐⠡⢂⠅⡂⡂⠄⢀⠂⠂⡈⢀⠠⠐⠈⠀⠁
					       ⢂⠂⠰⢈⠈⠠⠀⠠⠐⢀⢝⣞⡮⡯⣞⢽⢕⢵⢕⢕⣕⢗⢝⢼⡸⡪⡣⡳⡽⣕⢷⢝⢮⢲⢡⢁⠊⢄⢂⠠⠡⠀⠅⠐⢀⠠⠀⠂⠀⠂
					       ⠅⠨⠐⡐⠈⢀⠈⠠⠐⠠⢳⠷⢝⡮⣳⡫⡯⣫⡳⣝⢮⡫⡎⣇⢇⢇⢧⢳⢕⢯⡺⡽⣹⢕⡗⡢⡡⠡⠀⠄⠨⢈⠠⠁⠄⠄⠠⠀⠡⠀
					       ⠁⠌⡐⠠⠐⠀⠐⢀⠐⠠⠡⢋⢇⡯⣆⣖⢼⡺⣪⢫⢳⡱⡣⡳⣹⢪⢣⢳⢩⣳⢽⢝⡾⡵⣹⢕⡪⠀⠂⠡⠨⢀⠊⠈⢀⠀⠅⠊⢀⠐
					       ⢁⠡⠠⠁⢀⠈⠀⠄⠀⠅⠌⡪⡿⣜⣜⢮⡳⡍⣎⢎⡎⣮⣪⢺⢸⢸⢸⢸⢕⡷⡽⡽⣺⢝⢮⡣⣇⠇⡈⠌⡀⡂⠨⠀⠂⠠⠁⡈⡠⢐
					       ⠄⠂⠐⠀⠄⢀⠁⢀⠡⠂⠐⢨⣫⢷⢯⢷⢽⣺⢵⡳⣝⢮⢪⢊⢎⢎⢎⣗⡽⣺⡽⣝⣞⢽⡱⣝⢼⢸⢀⠂⡀⠄⢐⠀⡁⡂⠅⡔⢔⢢
					       ⢀⠁⠄⡁⢀⢂⠠⠀⠄⠐⠈⢄⡷⡯⣻⢽⢝⣞⢽⡹⣪⢣⢣⢣⢣⡣⣓⠵⣝⡵⡯⣗⢗⢽⢸⢪⢎⢇⠇⠄⢄⢂⢂⢪⢐⡪⡊⡎⢎⣒
					       ⡔⢌⢖⢔⠔⡔⡐⡔⡌⡢⣕⢯⡫⣏⢮⢳⢹⣪⡳⡝⡜⡬⣪⢮⡳⡹⡬⡹⠸⣺⢽⡺⣱⢳⢕⡕⡇⡇⡇⠣⠣⡣⡱⢑⠕⡑⡱⢘⠱⡐
					       ⣣⢣⢣⢣⢣⢣⢇⢧⣣⢯⡳⢕⢇⢇⢇⢇⢇⢎⢎⡎⡎⣞⡵⣳⢝⣝⢼⠸⠨⡺⡝⣞⢜⢕⠧⡳⡹⡨⢂⠡⡁⡐⢐⢁⢂⢊⢐⠡⢑⢐
					       ⡎⣎⢇⢏⡞⡎⡧⣣⣗⢇⢇⢗⢕⢜⡜⡜⣎⢮⢳⡱⢕⢗⡽⣪⡳⡪⡪⡊⢌⠎⡵⡹⡜⡎⡞⡼⡌⡢⢁⠐⡀⢂⠐⠄⢂⢂⢆⢪⢂⢇
					       ⡮⡲⡹⡪⡪⣣⢫⢺⡪⡳⡱⡱⡝⡼⡜⡎⡮⣎⢗⢵⡱⣝⢮⡳⣝⢮⢳⡱⡐⡅⡣⣣⡣⣏⢮⣣⠫⣊⢂⢂⠂⠄⡂⡅⢆⢕⢜⢜⢸⢐
					       ⣜⢎⢧⢳⢹⡸⢜⢎⡝⡜⣎⢵⢹⢸⢸⢘⢙⠸⢑⠕⣸⣳⡣⡯⣗⢯⡳⣕⢕⢕⢝⡳⣝⢮⡫⡎⠎⢊⢈⠄⡪⡸⡨⡊⡎⡆⡇⡎⡎⡎
					       ⡣⡳⡱⡳⡱⡕⡝⣎⢮⢺⢸⢸⢘⢔⡐⢔⢔⢨⢔⢼⣺⡪⡯⡪⡺⣝⣞⢮⣳⡹⡼⣸⢪⡳⡱⢁⠱⡐⡔⢕⢌⢆⢇⠇⡇⡕⡕⡕⡕⡕
					       ⢏⡎⡗⡝⣜⢹⢸⢜⢎⢎⢧⢣⡣⡳⡸⡱⡱⡱⣣⢫⡪⡏⡮⡱⡸⡰⢕⢏⢞⠼⣚⢎⢳⢑⢕⢌⢎⢆⢇⢇⢣⢣⢣⢣⢣⢣⢣⡣⡣⡣
					       ⡣⡳⡹⡸⡪⡪⣪⢪⡪⡣⡣⣣⢇⢧⢫⡪⡣⡳⡱⡱⡱⡱⡱⡱⡱⡱⣱⢱⢱⢩⢢⢣⡣⡣⡣⡣⡣⡣⡣⡣⡫⡪⡪⡪⡪⡪⡪⡪⡪⡓
					       ⡱⡕⡕⣕⡕⡵⡱⢣⢣⢫⢪⢎⢎⢎⢇⢗⠕⡕⡕⡝⡜⢕⠕⡕⡕⢕⢪⢪⢕⢕⢕⢕⢎⢎⢎⢎⢎⢎⢎⢎⢎⢎⢎⢎⢎⠮⡪⡪⣚⢜
					     ]],
				},
				sections = {
					{ section = "header" },
					{
						pane = 2,
						{ section = "keys", gap = 1, padding = 1 },
						{
							icon = " ",
							title = "Recent files",
							section = "recent_files",
							indent = 2,
							padding = 1,
						},
						{ section = "startup" },
					},
				},
			},
		},
		keys = {},
	},
}
