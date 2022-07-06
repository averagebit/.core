local opt = vim.opt
local cmd = vim.cmd

-- General
opt.compatible = false -- Vi compatibility setting
opt.mouse = "nv" -- Disable mouse in command-line mode
opt.synmaxcol = 2500 -- Don't syntax highlight long lines
opt.history = 2000 -- Size of history to retain
opt.clipboard = "unnamedplus" -- Use unnamed clipboard
opt.splitbelow = true -- Always stplit to the bottom
opt.splitright = true -- Always split to the right
opt.switchbuf = "uselast" -- Jump to the last open window
opt.re = 0 -- Regex engine
opt.showcmd = true -- Show command in status line
opt.autoread = true -- Autoread on third party changes
opt.autowrite = true -- Save on buffer leave
opt.autowriteall = true -- Save on buffer leave
opt.modeline = false -- Disable modeline
opt.swapfile = false -- Disable swap file

cmd([[ set completeopt=menu,menuone ]]) -- Always show menu, even for one item
cmd([[ set completeopt+=noselect ]]) -- Do not select a match in the menu

-- Formatting
opt.wrap = false -- Disable text wrapping
opt.textwidth = 72 -- Set text width
opt.linebreak = true -- Break long lines at 'breakat'

cmd([[ set breakat=\ \	;:,!? ]]) -- Long lines break chars
cmd([[ set backspace=indent,eol,start ]]) -- Intuitive backspacing in insert mode
cmd([[ set whichwrap+=h,l,<,>,[,],~ ]]) -- Move to following line on certain keys
cmd([[ set formatoptions+=1 ]]) -- Don't break lines after a one-letter word
cmd([[ set formatoptions-=t ]]) -- Don't auto-wrap text
cmd([[ set formatoptions-=o ]]) -- Disable comment-continuation (normal 'o'/'O')

-- Searching
opt.ignorecase = true -- Search ignoring case
opt.smartcase = true -- Keep case when searching with *
opt.infercase = true -- Adjust case in insert completion mode
opt.incsearch = true -- Incremental search
opt.wrapscan = true -- Searches wrap around the end of the file

-- Tabs & Indents
opt.expandtab = true -- Expand tabs to spaces
opt.tabstop = 4 -- The number of spaces a tab is
opt.shiftwidth = 4 -- Number of spaces to use in auto(indent)
opt.smarttab = true -- Tab insert blanks according to 'shiftwidth'
opt.autoindent = true -- Use same indenting on new lines
opt.smartindent = true -- Smart autoindenting on new lines
opt.shiftround = true -- Round indent to multiple of 'shiftwidth'
opt.foldenable = false -- Disable automatic folding
opt.foldmethod = "indent" -- Set folding method

cmd([[ set softtabstop=-1 ]]) -- Automatically keeps in sync with shiftwidth

-- Timing
opt.timeout = true -- Configure timeouts
opt.ttimeout = true -- Configure timeouts
opt.timeoutlen = 500 -- Time out on mappings
opt.ttimeoutlen = 10 -- Time out on key codes
opt.updatetime = 200 -- Idle time to write swap and trigger CursorHold
opt.redrawtime = 1500 -- Time in milliseconds for stopping display redraw

-- Editor UI
opt.cursorline = true -- Line highglight visibility
opt.cursorcolumn = false -- Column highlight visibility
opt.showmode = true -- Mode visibility
opt.shortmess = "aoOTI" -- Shorten messages and don't show intro
opt.scrolloff = 2 -- Keep at least 2 lines above/below
opt.sidescrolloff = 5 -- Keep at least 5 lines left/right
opt.ruler = false -- Disable default status ruler
opt.list = false -- Don't show hidden characters
opt.hlsearch = true -- Search highlight

opt.showtabline = 0 -- Tabline visibility
opt.helpheight = 12 -- Minimum help window height
opt.winwidth = 30 -- Minimum width for active window
opt.winminwidth = 10 -- Minimum width for inactive windows
opt.winheight = 1 -- Minimum height for active window
opt.winminheight = 1 -- Minimum height for inactive window

opt.showcmd = true -- Command visibility in status line
opt.cmdheight = 1 -- Command line height
opt.cmdwinheight = 5 -- Command line lines
opt.equalalways = false -- Don't resize windows on split or close
opt.laststatus = 2 -- Status line visibility
opt.signcolumn = "yes" -- Sign column visibility
opt.colorcolumn = "" -- Colur column width at textwidth limit
opt.pumheight = 15 -- Popup menu height

cmd([[ set nu rnu ]]) -- Relative line numbers
