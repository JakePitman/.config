local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>t ", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>t+", ":NvimTreeResize +30<CR>") -- Increase width
keymap.set("n", "<leader>t-", ":NvimTreeResize -30<CR>") -- Decrease width

-- telescope
keymap.set("n", "<leader>f ", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fa", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
