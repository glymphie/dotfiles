local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>rr", "<cmd>Dispatch python %<cr>", {desc = "Run file as user"})
keymap.set("n", "<leader>rR", "<cmd>Dispatch doas python %<cr>", {desc = "Run file as root"})
