-- General keymaps
local keymap = vim.keymap
local cmd = vim.cmd

-- Moving in splitscreen
keymap.set("n", "<leader>h", "<C-w>h", { desc = "Jump to left window" })
keymap.set("n", "<leader>j", "<C-w>j", { desc = "Jump to down window" })
keymap.set("n", "<leader>k", "<C-w>k", { desc = "Jump to up window" })
keymap.set("n", "<leader>l", "<C-w>l", { desc = "Jump to right window" })

-- Copy to system clipboard
keymap.set("n", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
keymap.set("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })

-- Spelling - Spell-checking for English, and Danish - Orthography
keymap.set(
	"n",
	"<leader>oe",
	"<cmd>setlocal spell! spelllang=en_us<cr>",
	{ silent = true, desc = "Enable/Disable spellcheck: English" }
)
keymap.set(
	"n",
	"<leader>od",
	"<cmd>setlocal spell! spelllang=da<cr>",
	{ silent = true, desc = "Enable/Disable spellcheck: Danish" }
)

-- Tabs
keymap.set("n", "<leader>tn", cmd.tabnext, { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", cmd.tabprevious, { desc = "Go to previous tab" })

-- Buffers
keymap.set("n", "<leader>bn", cmd.bnext, { desc = "Go to next buffer" })
keymap.set("n", "<leader>bp", cmd.bprevious, { desc = "Go to previous buffer" })
keymap.set("n", "<leader>bd", cmd.bdelete, { desc = "Close current buffer" })

-- Highlight move
keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move selection up" })
keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move selection down" })

-- Keep J to the left
keymap.set("n", "J", "mzJ`z", { desc = "J, but it stays in place" })

-- Paste but keep register
keymap.set("x", "<leader>p", '"_dP', { desc = "Paste but keep the current register" })

-- Columns
keymap.set(
	"n",
	"<leader>c8",
	"<cmd>set colorcolumn=80<cr><cmd>set textwidth=80<cr>",
	{ silent = true, desc = "Set column 80" }
)
keymap.set(
	"n",
	"<leader>c1",
	"<cmd>set colorcolumn=100<cr><cmd>set textwidth=100<cr>",
	{ silent = true, desc = "Set column 100" }
)
keymap.set(
	"n",
	"<leader>c0",
	"<cmd>set colorcolumn=0<cr><cmd>set textwidth=0<cr>",
	{ silent = true, desc = "Disable column" }
)

-- Paste diff without pluses infront
keymap.set(
	"n",
	"<leader>pd",
	"<cmd>let @+=substitute(@+,'^+','','g')<cr><cmd>let @+=substitute(@+,'\\n+','\\n','g')<cr>\"+p",
	{ silent = true, desc = "Paste copied diff -pluses." }
)
keymap.set(
	"v",
	"<leader>pd",
	"<cmd>let @+=substitute(@+,'^+','','g')<cr><cmd>let @+=substitute(@+,'\\n+','\\n','g')<cr>\"+p",
	{ silent = true, desc = "Paste copied diff -pluses." }
)
