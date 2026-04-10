-- START

-- 1. Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- 2. Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

-- 3. Tabs and Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- 4. Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

-- 5. Appearance
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.signcolumn = 'yes'
-- vim.opt.colorcolumn = '80'
vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 8
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.ruler = true
-- vim.opt.showmatch = true
-- vim.opt.matchtime = 2
vim.opt.list = true
vim.opt.listchars = {
  tab = '→ ',
  trail = '·',
  nbsp = '␣',
  extends = '»',
  precedes = '«',
  -- eol   = "↲",
}
vim.opt.fillchars = {
  eob = '~',
  fold = ' ',
  diff = '╱',
}
vim.opt.shortmess:append 'sI'
vim.opt.cmdheight = 1
vim.opt.showtabline = 1

-- 6. Line Wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = '↪ '
vim.opt.sidescroll = 1

-- 7. Splits and Windows
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.winminheight = 0
vim.opt.winminwidth = 0
vim.opt.equalalways = true

-- 8. Clipboard
vim.opt.clipboard = 'unnamedplus'

-- 9. Mouse
vim.opt.mouse = 'a'
vim.opt.mousehide = true
vim.opt.mousefocus = false

-- 10. Undo, Backup, Swap
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand '~/.local/share/nvim/undo'
vim.opt.undolevels = 10000
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- 11. Buffers and Files
vim.opt.hidden = true
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.modelines = 5

-- 12. Completion
vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'noselect' }
vim.opt.pumheight = 10
vim.opt.pumwidth = 15
vim.opt.pumblend = 0
vim.opt.complete = '.,w,b,u,t,i'

-- 13. Command Line and Wildmenu
vim.opt.history = 1000
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildignore:append {
  '*.o',
  '*.obj',
  '*.pyc',
  '*.class',
  '*/.git/*',
  '*/.hg/*',
  '*/.svn/*',
  '*/node_modules/*',
  '*/__pycache__/*',
  '*.jpg',
  '*.jpeg',
  '*.png',
  '*.gif',
  '*.bmp',
  '*.zip',
  '*.tar.gz',
  '*.tar.bz2',
}
vim.opt.wildignorecase = true

-- 14. Formatting
vim.opt.textwidth = 0
vim.opt.formatoptions:remove { 'c', 'r', 'o' }
vim.opt.formatoptions:append { 'j' }
vim.opt.backspace = 'indent,eol,start'
vim.opt.joinspaces = false

-- 15. Folding
vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 4
vim.opt.foldminlines = 1
vim.opt.foldcolumn = '0'

-- 16. Spell Checking
vim.opt.spell = false
vim.opt.spelllang = { 'en_us' }
vim.opt.spellsuggest = 'best,9'
vim.opt.spellfile = vim.fn.expand '~/.local/share/nvim/spell/en.utf-8.add'

-- 17. Diff Mode
vim.opt.diffopt:append 'filler'
vim.opt.diffopt:append 'internal'
vim.opt.diffopt:append 'algorithm:patience'
vim.opt.diffopt:append 'indent-heuristic'
vim.opt.diffopt:append 'iwhite'
vim.opt.diffopt:append 'vertical'

-- 18. Encoding and File Format
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8,ucs-bom,latin1'
vim.opt.fileformat = 'unix'
vim.opt.fileformats = 'unix,dos,mac'

-- 19. Performance and Timing
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10
vim.opt.updatetime = 250
vim.opt.redrawtime = 1500
vim.opt.lazyredraw = false

-- 20. Terminal and Shell
vim.opt.shell = '/bin/bash'
-- vim.opt.shellflags = '-c'
-- vim.opt.t_Co = nil

-- 21. Grep Integration
if vim.fn.executable 'rg' == 1 then
  vim.opt.grepprg = 'rg --vimgrep --smart-case'
  vim.opt.grepformat = '%f:%l:%c:%m'
elseif vim.fn.executable 'ag' == 1 then
  vim.opt.grepprg = 'ag --vimgrep'
  vim.opt.grepformat = '%f:%l:%c:%m'
end

-- 22. Quickfix Location list
vim.opt.switchbuf = 'useopen,uselast'

-- 23. Sessions and Views
vim.opt.sessionoptions = {
  'buffers',
  'curdir',
  'folds',
  'help',
  'tabpages',
  'winsize',
  'terminal',
}
vim.opt.viewoptions = { 'folds', 'cursor', 'curdir', 'slash', 'unix' }

-- 24. Netrw (built-in file explorer)
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_browse_split = 4
vim.g.netrw_keepdir = 0
vim.g.netrw_sort_by = 'name'
vim.g.netrw_sort_options = 'i'
vim.g.netrw_list_hide = [[\.git/,\.DS_Store,__pycache__/,node_modules/]]
vim.g.netrw_hide = 1

-- 25. Colorscheme
vim.cmd.colorscheme 'habamax'

-- Kickstarter
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- Enable break indent
vim.o.breakindent = true
-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'
-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true

-- END
