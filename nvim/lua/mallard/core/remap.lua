-- neovim specific remaps, see /after for plugin specific remaps

-- allows highlighted text to be moved
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<S-down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<S-up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- better cursor positions on join, screen up/down and search results
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines (keep cursor)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- disables Q
vim.keymap.set("n", "Q", "<nop>", { desc = "Disabled" })

-- save + copy file or selection
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", { desc = "Save file" })
vim.keymap.set("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "Copy whole file" })
vim.keymap.set("v", "<C-c>", "<cmd> execute 'normal \"+y' <CR>", { desc = "Copy selection" })

-- formats JSON files using jq
vim.keymap.set("n", "<C-J>", ":%!jq '.' <CR>", { desc = "Format JSON (jq)" })
