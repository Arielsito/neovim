-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc" },
	callback = function()
		vim.wo.spell = false
		vim.wo.conceallevel = 0
	end,
})

-- Lsp Colors for Undercurl
local function get_diag_color(group)
	local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
	if ok and hl.fg then
		return string.format("#%06x", hl.fg)
	end
end

local function set_undercurl_color()
	local colors = {
		Error = get_diag_color("DiagnosticError"),
		Warn = get_diag_color("DiagnosticWarn"),
		Info = get_diag_color("DiagnosticInfo"),
		Hint = get_diag_color("DiagnosticHint"),
	}

	vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
		undercurl = true,
		sp = colors.Error,
	})

	vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
		undercurl = true,
		sp = colors.Warn,
	})

	vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
		undercurl = true,
		sp = colors.Info,
	})

	vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
		undercurl = true,
		sp = colors.Hint,
	})
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = set_undercurl_color,
})

set_undercurl_color()
