local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- convenience function
local keymap = vim.api.nvim_set_keymap

-- must happen before plugins are required (otherwise wrong leader will be used)
-- mee `:help mapleader`
-- from chris@machine: what is this doing? 
-- -keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set("n", "<leader>po", vim.cmd.Ex)

-- resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- use esc to exit terminal mode
-- see :help terminal-emulator
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- keymaps for telescope
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>F", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ previewer = true }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
