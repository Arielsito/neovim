local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit<Return>")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window uses Vim Tmux Navigator plugin in the lua/plugins/ui.lua file
-- <C-h> Move to window left
-- <C-j> Move to window Down
-- <C-k> Move to window Up
-- <C-l> Move to window Right
-- <C-\\> Move to previous window

-- Resize window
keymap.set("n", "<left>", "<C-w><")
keymap.set("n", "<right>", "<C-w>>")
keymap.set("n", "<up>", "<C-w>+")
keymap.set("n", "<down>", "<C-w>-")

-- LSP
keymap.set("n", "<C-M-j>", function()
	vim.diagnostic.goto_next({ float = false })
end, opts)
