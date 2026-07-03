local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>rr", "<cmd>Dispatch bash %<cr>", {desc = "Run file as user"})
keymap.set("n", "<leader>rR", "<cmd>Dispatch doas bash %<cr>", {desc = "Run file as root"})
