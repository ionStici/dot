
# Neovim: Option Configurations

*Config file lives at: `~/.config/nvim/init.lua`. How Configuration Works?*

Neovim reads `~/.config/nvim/init.lua` on startup. Everything here uses the Lua API:

```lua
vim.opt.option = value    -- set an option (like :set in vimscript)
vim.g.variable = value    -- set a global variable
vim.o.option = value      -- alternative: set option via vim.o (string-based)
vim.keymap.set(...)       -- create a key mapping
vim.cmd("...")            -- run a vimscript/Ex command
vim.api.nvim_...          -- low-level Neovim API
```

`vim.opt` is preferred over `vim.o` because it's type-safe and supports Lua tables for list-like options.

---

## 1. Leader Key

```lua
-- The leader key is a user-defined prefix for all your custom mappings.
-- It must be set before any mappings that use <leader> are defined.
-- Space is the most popular choice — easy to reach with either thumb.
vim.g.mapleader = " "

-- The local leader is used for buffer-local mappings (e.g., filetype-specific).
-- Backslash is a common choice since it doesn't conflict with mapleader.
vim.g.maplocalleader = "\\"
```

---

## 2. Line Numbers

```lua
-- Show absolute line numbers in the gutter.
vim.opt.number = true

-- Show relative line numbers for all lines except the current one.
-- The current line shows the absolute number (when combined with number = true).
-- This makes vertical motions like 5j, 12k trivial to calculate at a glance.
vim.opt.relativenumber = true

-- Width of the number column. "auto" adjusts dynamically.
vim.opt.numberwidth = 4
```

---

## 3. Tabs and Indentation

```lua
-- Number of visual spaces that a tab character represents when displayed.
vim.opt.tabstop = 4

-- Number of spaces inserted when you press Tab in insert mode.
-- When equal to tabstop, Tab inserts a real tab character (if expandtab is false).
vim.opt.softtabstop = 4

-- Number of spaces used for each indentation level (>>, <<, =, autoindent).
vim.opt.shiftwidth = 4

-- Convert Tab keypresses into spaces. The file will only contain spaces.
-- Set to false if your project requires real tab characters (e.g., Makefile).
vim.opt.expandtab = true

-- Round indentation to a multiple of shiftwidth when using >> or <<.
vim.opt.shiftround = true

-- Copy the indentation of the current line when starting a new line.
vim.opt.autoindent = true

-- Smarter autoindent: adds indentation after lines ending with {, (, etc.
-- and removes it after lines starting with }, ), etc.
vim.opt.smartindent = true
```

---

## 4. Search

```lua
-- Highlight all matches for the current search pattern.
vim.opt.hlsearch = true

-- Show matches incrementally as you type the search pattern.
vim.opt.incsearch = true

-- Ignore case when searching.
vim.opt.ignorecase = true

-- Override ignorecase if the search pattern contains any uppercase letters.
-- So /foo matches Foo and FOO, but /Foo only matches Foo.
vim.opt.smartcase = true

-- Wrap search around the end/beginning of the file.
vim.opt.wrapscan = true
```

---

## 5. Appearance

```lua
-- Enable 24-bit RGB color in the terminal. Required for most colorschemes.
-- Your terminal must also support true color (alacritty, kitty, wezterm all do).
vim.opt.termguicolors = true

-- Highlight the entire line the cursor is currently on.
vim.opt.cursorline = true

-- Highlight the column the cursor is in. Useful for aligning code.
-- Can feel visually noisy - enable only if you find it useful.
vim.opt.cursorcolumn = false

-- Always display the sign column (the gutter left of line numbers).
-- "yes" prevents the editor from jumping left/right when signs appear/disappear
-- (e.g., git changes, LSP diagnostics).
-- "yes:1" = always show, 1 column wide.
vim.opt.signcolumn = "yes"

-- Show a vertical line at column 80 as a soft line-length guide.
-- Use a comma-separated string for multiple columns: "80,120"
vim.opt.colorcolumn = "80"

-- Minimum number of screen lines to keep above and below the cursor.
-- Keeps the cursor vertically centered as you scroll through a file.
vim.opt.scrolloff = 12

-- Minimum number of screen columns to keep to the left and right of the cursor.
-- Useful when wrap is off and you work near the end of long lines.
vim.opt.sidescrolloff = 8

-- Show the current mode (INSERT, VISUAL, etc.) in the command line.
-- Usually disabled if a statusline plugin shows the mode already.
vim.opt.showmode = false

-- Show partial commands in the last line of the screen as you type them.
-- E.g., shows "d" after you press d, waiting for a motion.
vim.opt.showcmd = true

-- Always show the status line.
-- 0 = never, 1 = only if there are splits, 2 = always.
vim.opt.laststatus = 2

-- Show the cursor position (line, column) in the status line.
vim.opt.ruler = true

-- Briefly jump to matching bracket/paren when you type a closing one.
vim.opt.showmatch = true

-- Duration in tenths of a second to show the matching bracket.
vim.opt.matchtime = 2

-- Show invisible characters (tabs, trailing spaces, etc.) as visible symbols.
vim.opt.list = true

-- Define what symbols to use when list = true.
vim.opt.listchars = {
    tab      = "→ ",   -- tab character displayed as an arrow -- tab = '» '
    trail    = "·",    -- trailing spaces displayed as dots
    nbsp     = "␣",    -- non-breaking space
    extends  = "»",    -- line continues beyond the right screen edge
    precedes = "«",    -- line continues beyond the left screen edge
    -- eol   = "↲",    -- end of line marker (noisy, disabled by default)
}

-- Characters to fill special UI areas.
-- eob = "~" is the classic tilde at the end of the buffer (Vim default).
-- Set eob = " " to hide them for a cleaner look.
vim.opt.fillchars = {
    eob   = "~",   -- end of buffer
    fold  = " ",   -- folded line fill character
    diff  = "╱",   -- deleted lines in diff mode
}

-- Suppress various informational messages in the command line.
-- "s" = no search wrap messages, "I" = no intro message on startup.
vim.opt.shortmess:append("sI")

-- Number of lines used for the command-line area.
-- 1 = standard. 2 = breathing room. 0 = (Neovim 0.10+ with noice.nvim).
vim.opt.cmdheight = 1

-- Always show the tabline.
-- 0 = never, 1 = only if multiple tabs, 2 = always.
vim.opt.showtabline = 1
```

---

## 6. Line Wrapping

```lua
-- Wrap long lines visually (doesn't insert actual line breaks in the file).
-- Set to false for code; horizontal scrolling is cleaner.
vim.opt.wrap = true

-- When wrap is true, break at word boundaries instead of mid-word.
vim.opt.linebreak = true

-- When wrap is true, prefix visually wrapped lines with this string.
vim.opt.showbreak = "↪ "

-- When wrap is false, allow the screen to scroll horizontally by 1 column
-- at a time (smoother than jumping).
vim.opt.sidescroll = 1
```

---

## 7. Splits and Windows

```lua
-- When splitting horizontally (:sp), open the new window below.
vim.opt.splitbelow = true

-- When splitting vertically (:vsp), open the new window to the right.
vim.opt.splitright = true

-- Minimum height a window can be shrunk to.
vim.opt.winminheight = 0

-- Minimum width a window can be shrunk to.
vim.opt.winminwidth = 0

-- When on, all windows are automatically made the same size after splitting
-- or closing. Set to false to control sizes manually.
vim.opt.equalalways = true
```

---

## 8. Clipboard

```lua
-- Use the system clipboard for all yank/delete/paste operations by default.
-- "unnamedplus" = the + register (Ctrl+C / Ctrl+V clipboard on Linux/Windows).
-- "unnamed"     = the * register (X11 primary/middle-click clipboard).
-- Both:         vim.opt.clipboard = "unnamed,unnamedplus"
-- Note: on Arch Linux, install xclip or xsel (X11) or wl-clipboard (Wayland).
vim.opt.clipboard = "unnamedplus"
```

---

## 9. Mouse

```lua
-- Enable mouse support.
-- "a" = all modes. "n" = normal only. "i" = insert only. "" = disabled.
vim.opt.mouse = "a"

-- Hide the mouse cursor while typing (reappears on mouse movement).
vim.opt.mousehide = true

-- Focus follows mouse: switch to whatever window the mouse hovers over.
-- Can be disorienting — most people leave this off.
vim.opt.mousefocus = false
```

---

## 10. Undo, Backup, Swap

```lua
-- Persist undo history to disk so you can undo changes across sessions.
-- Even after closing and reopening a file, you can still undo yesterday's edits.
vim.opt.undofile = true

-- Directory where undo files are stored.
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

-- Maximum number of changes that can be undone.
vim.opt.undolevels = 10000

-- Disable backup files (file~). Most people rely on git instead.
vim.opt.backup = false

-- Disable the temporary backup file created during a write operation.
vim.opt.writebackup = false

-- Disable swap files (.swp). With undofile + git they're rarely needed.
-- They exist to recover from crashes but cause noise in project directories.
vim.opt.swapfile = false
```

---

## 11. Buffers and Files

```lua
-- Allow switching away from a modified buffer without saving it first.
-- The buffer stays open (hidden) and you can return to it later.
vim.opt.hidden = true

-- Automatically re-read a file if it was changed outside of Neovim.
vim.opt.autoread = true

-- Automatically write the buffer to disk before certain operations
-- (e.g., :make, :next, switching buffers with autowrite-triggering commands).
vim.opt.autowrite = false

-- Number of lines at the start/end of a file to scan for modeline comments.
-- Modelines look like: // vim: set ts=2 sw=2 :
vim.opt.modelines = 5
```

---

## 12. Completion

```lua
-- Controls the behavior of the insert-mode completion menu (Ctrl-n / Ctrl-p).
-- "menu"     = show a popup menu when there are multiple matches
-- "menuone"  = show menu even for a single match
-- "noinsert" = don't insert a match until you explicitly select one
-- "noselect" = don't auto-select the first match in the menu
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }

-- Maximum number of items shown in the completion popup menu.
vim.opt.pumheight = 10

-- Minimum width of the completion popup menu.
vim.opt.pumwidth = 15

-- Opacity of the completion popup. 0 = fully opaque. 1-100 = % transparent.
vim.opt.pumblend = 0

-- Sources for native insert mode completion (Ctrl-n / Ctrl-p).
-- . = current buffer, w = windows, b = other loaded buffers,
-- u = unloaded buffers, t = tags, i = included files
vim.opt.complete = ".,w,b,u,t,i"
```

---

## 13. Command Line and Wildmenu

```lua
-- Number of command history entries to remember.
vim.opt.history = 1000

-- Enable the enhanced command-line completion menu (Tab completion).
vim.opt.wildmenu = true

-- Completion behavior when pressing Tab in the command line.
-- "longest:full" = first complete to longest common string, then show menu.
-- "full"         = cycle through all matches.
vim.opt.wildmode = "longest:full,full"

-- Ignore these file patterns in wildmenu completions.
vim.opt.wildignore:append({
    "*.o", "*.obj", "*.pyc", "*.class",
    "*/.git/*", "*/.hg/*", "*/.svn/*",
    "*/node_modules/*", "*/__pycache__/*",
    "*.jpg", "*.jpeg", "*.png", "*.gif", "*.bmp",
    "*.zip", "*.tar.gz", "*.tar.bz2",
})

-- Case-insensitive matching in the wildmenu.
vim.opt.wildignorecase = true
```

---

## 14. Formatting

```lua
-- Maximum line width for automatic text wrapping. 0 = disabled.
vim.opt.textwidth = 0

-- Format options - each letter enables a behavior.
-- See :help fo-table for the full list.
-- c = auto-wrap comments at textwidth
-- r = insert comment leader on Enter in insert mode
-- o = insert comment leader on o/O in normal mode
-- q = allow formatting comments with gq
-- j = remove comment leader when joining lines with J
-- n = recognize numbered lists when formatting
-- l = don't break already-long lines in insert mode
--
-- Removing "r" and "o" stops Neovim from auto-inserting comment prefixes.
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.formatoptions:append({ "j" })

-- Allow backspace to delete over autoindent, line breaks, and insert start.
vim.opt.backspace = "indent,eol,start"

-- Don't add two spaces after a period when joining lines (J or gq).
vim.opt.joinspaces = false
```

---

## 15. Folding

```lua
-- Method used to create folds:
-- "manual"  = you create folds yourself with zf
-- "indent"  = fold by indentation level (good default for most languages)
-- "expr"    = fold using a custom expression (used with Treesitter)
-- "syntax"  = fold by syntax highlighting (can be slow)
-- "marker"  = fold between {{{ and }}} markers in the file
-- "diff"    = fold unchanged lines in diff mode
vim.opt.foldmethod = "indent"

-- Open all folds by default when a file is opened.
-- 0 = all folds closed, 99 = all folds open.
vim.opt.foldlevelstart = 99

-- Maximum nesting level for folds.
vim.opt.foldnestmax = 4

-- A fold is only created if it spans at least this many lines.
vim.opt.foldminlines = 1

-- Show fold level indicator in the fold column. 0 = no fold column.
vim.opt.foldcolumn = "0"
```

Fold commands reference:

```
za      toggle fold under cursor
zc      close fold under cursor
zo      open fold under cursor
zC      close all folds under cursor (recursive)
zO      open all folds under cursor (recursive)
zR      open all folds in file
zM      close all folds in file
zj      move to next fold
zk      move to previous fold
[z      move to start of current fold
]z      move to end of current fold
```

---

## 16. Spell Checking

```lua
-- Enable spell checking. Usually set per-filetype with autocmds, not globally.
vim.opt.spell = false

-- Languages to check spelling for.
vim.opt.spelllang = { "en_us" }

-- Number and type of suggestions shown for misspelled words (z=).
vim.opt.spellsuggest = "best,9"

-- File where custom words are saved (zg adds to this file).
vim.opt.spellfile = vim.fn.expand("~/.local/share/nvim/spell/en.utf-8.add")
```

Spell commands reference:

```
]s      jump to next misspelled word
[s      jump to previous misspelled word
z=      suggest corrections for word under cursor
zg      add word under cursor to spellfile (mark as good)
zw      mark word under cursor as wrong
zug     undo zg (remove from spellfile)
```

---

## 17. Diff Mode

```lua
-- Show filler lines to keep file contents aligned in diff splits.
vim.opt.diffopt:append("filler")

-- Use Neovim's internal diff library (faster than external diff).
vim.opt.diffopt:append("internal")

-- Use the patience diff algorithm (produces more readable diffs for code).
vim.opt.diffopt:append("algorithm:patience")

-- Indent heuristic: improves diff readability for indented code blocks.
vim.opt.diffopt:append("indent-heuristic")

-- Ignore whitespace differences when diffing.
-- "iwhite" = ignore all whitespace. "iblank" = ignore blank lines.
vim.opt.diffopt:append("iwhite")

-- Open diff in vertical splits (side by side) by default.
vim.opt.diffopt:append("vertical")
```

---

## 18. Encoding and File Format

```lua
-- Internal encoding Neovim uses. UTF-8 is the correct and only choice.
vim.opt.encoding = "utf-8"

-- Encoding written to files when saving.
vim.opt.fileencoding = "utf-8"

-- List of encodings tried when opening a file (in order of preference).
vim.opt.fileencodings = "utf-8,ucs-bom,latin1"

-- Line ending format for new files.
-- "unix" = LF (\n), "dos" = CRLF (\r\n), "mac" = CR (\r)
-- Always use unix unless you specifically need Windows-compatible files.
vim.opt.fileformat = "unix"

-- Accepted line ending formats when reading existing files.
vim.opt.fileformats = "unix,dos,mac"
```

---

## 19. Performance and Timing

```lua
-- Milliseconds to wait for a mapped key sequence to complete.
-- Lower = more responsive. If you have multi-key mappings, don't go below ~200.
vim.opt.timeoutlen = 300

-- Milliseconds to wait for a terminal key code (e.g., the Escape sequence).
-- Should be lower than timeoutlen to avoid insert mode lag on Esc.
vim.opt.ttimeoutlen = 10

-- Milliseconds before the CursorHold event fires.
-- Affects LSP hover documentation, plugin features that react to idle cursor.
vim.opt.updatetime = 250

-- Maximum time in milliseconds to spend on syntax highlighting per redraw.
-- Increase if you see "redrawing too slow" in large files.
vim.opt.redrawtime = 1500

-- Don't redraw the screen while executing macros, registers, or scripts.
-- Set to true for faster macro execution. Causes flicker in some setups.
vim.opt.lazyredraw = false
```

---

## 20 — Terminal and Shell

```lua
-- Shell used for :! commands and :terminal.
-- Change to your preferred shell.
vim.opt.shell = "/bin/bash"

-- Flags passed to the shell when running external commands.
vim.opt.shellflags = "-c"

-- Allow terminal colors to display properly.
-- This is usually handled automatically by termguicolors.
vim.opt.t_Co = nil  -- not needed in Lua; handled by termguicolors
```

---

## 21. Grep Integration

```lua
-- External program used by :grep and :vimgrep.
-- ripgrep (rg) is the best choice: fast, respects .gitignore, smart defaults.
if vim.fn.executable("rg") == 1 then
    vim.opt.grepprg    = "rg --vimgrep --smart-case"
    vim.opt.grepformat = "%f:%l:%c:%m"
elseif vim.fn.executable("ag") == 1 then
    -- The Silver Searcher as a fallback
    vim.opt.grepprg    = "ag --vimgrep"
    vim.opt.grepformat = "%f:%l:%c:%m"
end

-- Usage:
-- :grep pattern **/*.lua     search recursively for pattern
-- :grep -w word              whole word search
-- :copen                     open results in quickfix window
```

---

## 22. Quickfix and Location List

```lua
-- Controls where files are opened when jumping from quickfix/loclist.
-- "useopen"  = use an already-open window if available
-- "uselast"  = use the last accessed window
-- "split"    = open in a new split
vim.opt.switchbuf = "useopen,uselast"
```

Quickfix commands reference:
```
:copen      open quickfix window
:cclose     close quickfix window
:cnext      go to next item
:cprev      go to previous item
:cfirst     go to first item
:clast      go to last item
:cc N       go to item N
:cdo cmd    run cmd on each quickfix entry
:lopen      same as above but for location list (window-local)
```

---

## 23. Sessions and Views

```lua
-- What gets saved and restored by :mksession / :source Session.vim
vim.opt.sessionoptions = {
    "buffers",    -- all open buffers
    "curdir",     -- the current working directory
    "folds",      -- fold states
    "help",       -- help windows
    "tabpages",   -- all tabs
    "winsize",    -- window sizes
    "terminal",   -- terminal buffers
}

-- What gets saved and restored by :mkview / :loadview
vim.opt.viewoptions = { "folds", "cursor", "curdir", "slash", "unix" }
```

---

## 24. Netrw (Built-in File Explorer)

```lua
-- Display style for netrw.
-- 1 = thin list, 2 = multi-column list, 3 = wide list, 4 = tree view
vim.g.netrw_liststyle = 3

-- Hide the banner shown at the top of netrw (press I to toggle when hidden).
vim.g.netrw_banner = 0

-- Width of the netrw pane when using :Lexplore (as a percentage).
vim.g.netrw_winsize = 25

-- Where files are opened when you press Enter in netrw.
-- 0 = same window, 1 = horizontal split, 2 = vertical split,
-- 3 = new tab, 4 = previous window (most useful with :Lexplore)
vim.g.netrw_browse_split = 4

-- Keep the current directory when browsing (0 = follow browsed directory).
vim.g.netrw_keepdir = 0

-- Sort files by: "name", "time", "size", "exten"
vim.g.netrw_sort_by = "name"

-- Case sensitivity for sorting: "i" = insensitive
vim.g.netrw_sort_options = "i"

-- Hide certain files from netrw listing (uses regex).
vim.g.netrw_list_hide = [[\.git/,\.DS_Store,__pycache__/,node_modules/]]

-- Apply the hide list automatically (1 = yes).
vim.g.netrw_hide = 1
```

---

## 25. Colorscheme

```lua
-- Built-in colorschemes available without any plugins:
-- "default", "habamax", "lunaperche", "retrobox", "sorbet",
-- "wildcharm", "zaibatsu", "quiet", "morning", "evening", "industry"
--
-- "habamax" is the most complete and usable of the built-in options.
vim.cmd.colorscheme("habamax")

-- When you add a plugin manager later, popular choices are:
-- catppuccin, tokyonight, gruvbox, rose-pine, kanagawa, nord, onedark
```

---

## Kickstarter

```lua
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- Enable break indent
vim.o.breakindent = true
-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'
-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true
```

---

## `options.lua`

```lua
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
```

---

