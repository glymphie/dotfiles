local keymap = vim.keymap -- for conciseness
local cmd = vim.cmd -- for conciseness

keymap.set("n", "<leader>rr", cmd.Dispatch, {desc = "Make"})
keymap.set("n", "<leader>mp", "<cmd>!zathura $(find . -name '*.pdf') & disown<cr><cr>", {desc = "Preview in Zathura"})
