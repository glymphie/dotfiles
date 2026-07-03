local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>rr", "<cmd>Dispatch cargo run<cr>", { desc = "Cargo run project" })
keymap.set("n", "<leader>rR", "<cmd>Dispatch cargo run --release<cr>", { desc = "Cargo run project for release" })
keymap.set("n", "<leader>rb", "<cmd>Dispatch cargo build<cr>", { desc = "Cargo build project" })
keymap.set("n", "<leader>rB", "<cmd>Dispatch cargo build --release<cr>", { desc = "Cargo build project for release" })
