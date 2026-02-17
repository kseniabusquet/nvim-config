# Neovim Config Guide

A comprehensive guide to your Neovim setup, written for someone coming from VSCode or Emacs.

---

## The Most Important Concept: Modes

Unlike VSCode or Emacs, Neovim is **modal** — the keyboard behaves differently depending on which mode you're in.

| Mode | How to enter | What it's for |
|------|-------------|---------------|
| **Normal** | `Esc` | Navigation, commands. This is your "home base" |
| **Insert** | `i`, `a`, `o` | Typing text (like a normal editor) |
| **Visual** | `v`, `V`, `Ctrl-v` | Selecting text |
| **Command** | `:` | Running commands (save, quit, etc.) |

**The golden rule:** always press `Esc` to get back to Normal mode when in doubt.

---

## The Leader Key

Your leader key is **`Space`**. It's a prefix for most custom shortcuts. When you see `<leader>x`, press `Space` then `x`.

**Tip:** Press `Space` and wait — a popup (which-key) will show you all available shortcuts from that prefix.

---

## Essential Commands to Know First

```
:w       Save file
:q       Quit
:wq      Save and quit
:q!      Quit without saving
:e file  Open a file
```

---

## Navigation (Normal Mode)

### Basic Movement
| Key | Action |
|-----|--------|
| `h` / `l` | Move left / right |
| `j` / `k` | Move down / up |
| `w` | Jump to next word |
| `b` | Jump to previous word |
| `e` | Jump to end of word |
| `0` | Start of line |
| `$` | End of line |
| `gg` | Top of file |
| `G` | Bottom of file |
| `Ctrl-d` | Scroll down half page |
| `Ctrl-u` | Scroll up half page |
| `{` / `}` | Jump between paragraphs/blocks |

### Jumping Around
| Key | Action |
|-----|--------|
| `%` | Jump to matching bracket/paren |
| `Ctrl-o` | Jump back (previous location) |
| `Ctrl-i` | Jump forward |
| `''` | Jump to last position |
| `50G` | Go to line 50 |

---

## Editing (Normal Mode)

### Entering Insert Mode
| Key | Action |
|-----|--------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `I` | Insert at start of line |
| `A` | Insert at end of line |
| `o` | New line below, enter insert |
| `O` | New line above, enter insert |

### Changing Text
| Key | Action |
|-----|--------|
| `x` | Delete character under cursor |
| `dd` | Delete (cut) current line |
| `yy` | Yank (copy) current line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `u` | Undo |
| `Ctrl-r` | Redo |
| `r` | Replace single character |
| `cw` | Change word (delete word, enter insert) |
| `cc` | Change entire line |
| `C` | Change from cursor to end of line |
| `D` | Delete from cursor to end of line |
| `.` | Repeat last action (very powerful!) |

### Operators + Motions
Neovim uses `operator + motion` combos. Examples:
| Keys | Action |
|------|--------|
| `dw` | Delete word |
| `d$` | Delete to end of line |
| `d3j` | Delete 3 lines down |
| `y5w` | Yank 5 words |
| `ci"` | Change inside quotes |
| `ca(` | Change around parentheses |
| `di{` | Delete inside curly braces |
| `va[` | Visually select around brackets |

---

## Search & Replace

| Key / Command | Action |
|---------------|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor |
| `Esc` | Clear search highlights |
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace all, confirm each |
| `:'<,'>s/old/new/g` | Replace in visual selection |

Search is **case-insensitive** by default, but becomes case-sensitive if you use uppercase letters.

---

## Windows & Splits

| Key | Action |
|-----|--------|
| `:split` or `:sp` | Horizontal split |
| `:vsplit` or `:vs` | Vertical split |
| `Ctrl-h` | Move to left window |
| `Ctrl-l` | Move to right window |
| `Ctrl-j` | Move to lower window |
| `Ctrl-k` | Move to upper window |
| `:q` | Close current window |
| `Ctrl-w =` | Equalize window sizes |
| `Ctrl-w _` | Maximize height |
| `Ctrl-w |` | Maximize width |

---

## Buffers & Tabs

Buffers are open files. You don't need tabs the way you did in VSCode.

| Key | Action |
|-----|--------|
| `<leader><leader>` | Show all open buffers (Telescope) |
| `:bn` | Next buffer |
| `:bp` | Previous buffer |
| `:bd` | Close buffer |

---

## Telescope (Fuzzy Finder)

Your main tool for finding anything. Think of it as VSCode's `Ctrl-P` on steroids.

| Key | Action |
|-----|--------|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep (search file contents) |
| `<leader>sw` | Search word under cursor |
| `<leader><leader>` | Find open buffers |
| `<leader>sh` | Search help docs |
| `<leader>sk` | Search keymaps |
| `<leader>ss` | Search all Telescope pickers |
| `<leader>sd` | Search LSP diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Recent files |
| `<leader>sc` | Search commands |
| `<leader>sn` | Search Neovim config files |
| `<leader>/` | Fuzzy search in current buffer |
| `<leader>s/` | Grep in open files only |

**Inside Telescope:**
| Key | Action |
|-----|--------|
| `Ctrl-/` (insert) or `?` (normal) | Show Telescope keymaps |
| `Ctrl-n` / `Ctrl-p` | Navigate results |
| `Enter` | Open selected |
| `Ctrl-x` | Open in horizontal split |
| `Ctrl-v` | Open in vertical split |
| `Esc` | Close |

---

## LSP (Language Intelligence)

LSP gives you IDE-like features: go to definition, find references, rename, etc. Works for Clojure, JS, TS, Svelte, and Lua.

| Key | Action |
|-----|--------|
| `grd` | Go to definition |
| `grr` | Find references |
| `gri` | Go to implementation |
| `grt` | Go to type definition |
| `grn` | Rename symbol |
| `gra` | Code action (fix, refactor) |
| `grD` | Go to declaration |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `K` | Hover docs (show type/docs) |
| `Ctrl-k` | Toggle signature help (in insert mode) |
| `<leader>th` | Toggle inlay hints |
| `<leader>q` | Open diagnostics quickfix list |

### Diagnostics (Errors & Warnings)
| Key | Action |
|-----|--------|
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| (auto) | Floating error window opens when you jump |

---

## Autocompletion (blink.cmp)

Completions appear as you type based on LSP, snippets, and file paths.

| Key | Action |
|-----|--------|
| `Ctrl-n` / `Down` | Select next item |
| `Ctrl-p` / `Up` | Select previous item |
| `Ctrl-y` | Accept completion |
| `Ctrl-e` | Hide menu |
| `Ctrl-space` | Open menu / open docs |
| `Ctrl-k` | Toggle signature help |
| `Tab` / `Shift-Tab` | Move through snippet placeholders |

---

## GitHub Copilot

Copilot suggestions appear inline as ghost text. Auto-trigger is **off** — you summon it.

| Key | Action |
|-----|--------|
| `Ctrl-l` | Accept suggestion |
| `Ctrl-]` | Next suggestion |
| `Ctrl-[` | Previous suggestion |
| `Ctrl-x` | Dismiss suggestion |

---

## Formatting

Files are **auto-formatted on save** for Lua (stylua), JS/TS/Svelte (prettierd), and Clojure (cljfmt).

| Key | Action |
|-----|--------|
| `<leader>f` | Format buffer manually |

---

## Git

### Gitsigns (inline git info)
Signs appear in the gutter (`+` added, `~` changed, `_` deleted).

| Key | Action |
|-----|--------|
| `]h` | Next hunk |
| `[h` | Previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage entire buffer |
| `<leader>hR` | Reset entire buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff this file |
| `<leader>td` | Toggle deleted lines |

### LazyGit (full Git TUI)
| Key | Action |
|-----|--------|
| `<leader>g` | Open LazyGit |

Inside LazyGit, press `?` for help. It's a full Git UI — you can stage, commit, push, pull, manage branches, and resolve conflicts.

---

## Surround (mini.surround)

Add, delete, or replace surrounding characters (brackets, quotes, etc.).

| Key | Action | Example |
|-----|--------|---------|
| `sa` + motion + char | Add surrounding | `saiw)` → surrounds word with `()` |
| `sd` + char | Delete surrounding | `sd'` → removes `'` |
| `sr` + old + new | Replace surrounding | `sr)"` → replaces `)` with `"` |

---

## Text Objects (mini.ai)

Extended text objects for smarter selection. Use with `v`, `d`, `c`, `y`:

| Object | Meaning |
|--------|---------|
| `i)` / `a)` | Inside / around parentheses |
| `i"` / `a"` | Inside / around quotes |
| `i{` / `a{` | Inside / around curly braces |
| `it` / `at` | Inside / around HTML tag |
| `inq` | Inside next quote |
| `ilq` | Inside last quote |

---

## Clojure Development

### Conjure (REPL)

Conjure connects to a running Clojure REPL and lets you evaluate code interactively.

**Start a REPL first:** run `clj` or `lein repl` in your terminal, then open your file in Neovim.

| Key | Action |
|-----|--------|
| `<leader>ee` | Eval current expression |
| `<localleader>eb` | Eval buffer |
| `<localleader>ef` | Eval file |
| `<localleader>el` | Eval current line |
| `<localleader>ew` | Eval word |
| `<localleader>log` | Open REPL log |

> `<localleader>` is also `Space` in your config.

### vim-sexp (Structural Editing)

Move and manipulate s-expressions (like paredit in Emacs).

| Key | Action |
|-----|--------|
| `(` / `)` | Move to previous/next paren |
| `[[` / `]]` | Move to previous/next top-level form |
| `<I` / `>I` | Insert at start/end of form |
| `<f` / `>f` | Move form left/right |
| `<e` / `>e` | Move element left/right |

### nvim-parinfer

Automatically manages parentheses as you edit — keeps your Clojure structurally valid. It works silently in the background.

---

## Plugin Management (Lazy)

| Command | Action |
|---------|--------|
| `:Lazy` | Open plugin manager UI |
| `:Lazy update` | Update all plugins |
| `:Lazy install` | Install missing plugins |
| `:Lazy sync` | Update + install |
| `:Lazy build blink.cmp` | Rebuild a specific plugin |

---

## Mason (LSP/Tool Installer)

| Command | Action |
|---------|--------|
| `:Mason` | Open Mason UI |
| `:MasonInstall <name>` | Install a tool |
| `:MasonUninstall <name>` | Uninstall a tool |

Press `g?` inside Mason for help.

---

## TODOs in Comments

Special comment keywords are highlighted automatically:

```
-- TODO: something to do
-- FIXME: broken thing
-- NOTE: important note
-- HACK: workaround
-- WARN: be careful
```

Search them with `<leader>st` (if todo-comments telescope integration is active).

---

## Miscellaneous

| Key | Action |
|-----|--------|
| `Esc` (normal mode) | Clear search highlights |
| `Esc Esc` (terminal mode) | Exit terminal mode |
| `<leader>q` | Open diagnostic quickfix list |
| `gc` + motion | Toggle comment |
| `gcc` | Toggle comment on current line |

---

## Useful Commands

```
:checkhealth          Run health checks (great for debugging)
:Telescope colorscheme  Browse color themes
:ConformInfo          Show formatter status
:LspInfo             Show active LSP clients
:messages            Show recent messages/errors
:Tutor               Built-in Neovim tutorial
```

---

## Coming from VSCode

| VSCode | Neovim equivalent |
|--------|------------------|
| `Ctrl-P` | `<leader>sf` (Telescope find files) |
| `Ctrl-Shift-F` | `<leader>sg` (live grep) |
| `F12` / Go to definition | `grd` |
| `Shift-F12` / Find references | `grr` |
| `F2` / Rename | `grn` |
| `Ctrl-Space` / Autocomplete | `Ctrl-n` / `Ctrl-p` |
| `Ctrl-/` / Comment | `gcc` |
| `Ctrl-S` / Save | `:w` or `<leader>f` (format+save) |

---

## Coming from Emacs

| Emacs | Neovim equivalent |
|-------|------------------|
| `C-x C-s` / Save | `:w` |
| `C-x C-f` / Open file | `<leader>sf` |
| `M-x` / Command palette | `<leader>sc` |
| `C-s` / Search | `/` |
| `M-%` / Query replace | `:%s/old/new/gc` |
| `C-space` / Mark set | `v` (visual mode) |
| Paredit | vim-sexp + nvim-parinfer |
| CIDER | Conjure |
| Magit | LazyGit (`<leader>g`) |

---

## Quick Reference Card

```
MODES:  Esc=Normal  i=Insert  v=Visual  :=Command

MOVE:   hjkl  w/b/e  gg/G  Ctrl-d/u  0/$

EDIT:   i/a/o  dd/yy/p  u/Ctrl-r  .=repeat
        c/d/y + motion (cw, d$, yi", etc.)

SEARCH: /pattern  n/N  *  Esc=clear

FILES:  <leader>sf=find  <leader>sg=grep  <leader><leader>=buffers

LSP:    grd=def  grr=refs  grn=rename  gra=action  K=hover

GIT:    <leader>g=lazygit  ]h/[h=hunks  <leader>hs=stage

FORMAT: <leader>f=format (auto on save)

COPILOT: Ctrl-l=accept  Ctrl-]=next  Ctrl-x=dismiss
```
