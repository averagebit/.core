local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Jump to last active file
keymap("n", "<Leader>o", "<cmd>e#<CR>", opts)

-- Yank to the end of the line
keymap("n", "Y", "y$", opts)

-- Re-select blocks after indenting in visual/select mode
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv|", opts)

-- Indent and jump to first non-blank character linewise
keymap("n", ">>", ">>_", opts)
keymap("n", "<<", "<<_", opts)

-- Maintain cursor position and keep it centered during search & joining
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Drag current line/s vertically and auto-indent
keymap("n", "<Leader>k", "<cmd>m-2<CR>", opts)
keymap("n", "<Leader>j", "<cmd>m+<CR>", opts)
keymap("v", "<Leader>k", "<cmd>m'<-2<CR>gv=gv", opts)
keymap("v", "<Leader>j", "<cmd>m'>+<CR>gv=gv", opts)

-- Resize with arrows
keymap("n", "<Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<Right>", "<cmd>vertical resize +2<CR>", opts)

-- Toggle editor's visual effects
keymap("n", "<CR>", "<cmd>let @/ = ''<CR><CR>", opts)
keymap("n", "<Leader>th", "<cmd>nohlsearch<CR>", opts)
keymap("n", "<Leader>ts", "<cmd>setlocal spell!<CR>", opts)
keymap("n", "<Leader>tl", "<cmd>setlocal nolist!<CR>", opts)
keymap("n", "<Leader>tn", "<cmd>setlocal nonumber!<CR><cmd>setlocal rnu!<CR>", opts)
keymap(
	"n",
	"<Leader>tw",
	"<cmd>execute('setlocal wrap! breakindent! colorcolumn=' . (&colorcolumn == '' ? &textwidth : ''))<CR>",
	opts
)

-- Edit dotfiles
keymap("n", "<Leader>rca", "<cmd>cd ~/.config/alacritty<CR> | <cmd>e alacritty.yml<CR>", opts)
keymap("n", "<Leader>rcs", "<cmd>cd ~/.ssh<CR> | <cmd>e config<CR>", opts)
keymap("n", "<Leader>rct", "<cmd>cd ~/.config/tmux<CR> | <cmd>e tmux.conf<CR>", opts)
keymap("n", "<Leader>rcv", "<cmd>cd ~/.config/nvim<CR> | <cmd>e init.lua<CR>", opts)

vim.cmd([[
    cnoreabbrev W w
    cnoreabbrev qw wq
    cnoreabbrev Wq wq
    cnoreabbrev WQ wq
    cnoreabbrev Qa qa
    cnoreabbrev Bd bd
    cnoreabbrev bD bd
]])

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>pp", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>po", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>pb", "<cmd>Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
