--local opts = { noremap = true, silent = true }
local opts = {}

local term_opts = { silent = true }

-- Shorten function name
--local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<CR>", opts)

-- sodu Save
keymap("n", "<leader>W", ":w !sudo tee % > /dev/null<CR>", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)
keymap("t", "<C-v><Esc>", "<Esc>", term_opts)-- use this way to send <Esc> in the terminal

-- DAP
--keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<F8>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F5>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F6>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F7>", "<cmd>lua require'dap'.step_out()<cr>", opts)
--keymap("v", "<F9>", "<cmd>lua require'dapui'.eval()<cr>", opts)
--keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
--keymap("n", "<F8>", "<cmd>lua require'dap'.run_last()<cr>", opts)
--keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
--keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Toggle Tagbar
keymap("n", "<F1>", "<cmd>TagbarToggle<cr>", opts)
-- formatting
keymap("n", "<S-f>", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
