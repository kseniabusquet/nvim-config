--[[

=====================================================================
==================== read this before continuing ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   kickstart.nvim   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

what is kickstart?

  kickstart.nvim is *not* a distribution.

  kickstart.nvim is a starting point for your own configuration.
    the goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    once you've done that, you can start exploring, configuring and tinkering to
    make neovim your own! that might mean leaving kickstart just the way it is for a while
    or immediately breaking it into modular pieces. it's up to you!

    if you don't know anything about lua, i recommend taking some time to read through
    a guide. one possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    after understanding a bit more about lua, you can use `:help lua-guide` as a
    reference for how neovim integrates lua.
    - :help lua-guide
    - (or html version): https://neovim.io/doc/user/lua-guide.html

kickstart guide:

  todo: the very first thing you should do is to run the command `:tutor` in neovim.

    if you don't know what this means, type the following:
      - <escape key>
      - :
      - tutor
      - <enter key>

    (if you already know the neovim basics, you can skip this step.)

  once you've completed that, you can continue working through **and reading** the rest
  of the kickstart init.lua.

  next, run and read `:help`.
    this will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    this should be the first place you go to look when you're stuck or confused
    with something. it's one of my favorite neovim features.

    most importantly, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  i have left several `:help x` comments throughout the init.lua
    these are hints about where to find more information about the relevant settings,
    plugins or neovim features used in kickstart.

   note: look for lines like this

    throughout the file. these are for you, the reader, to help you understand what is happening.
    feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your neovim config.

if you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

i hope you enjoy your neovim journey,
- tj

p.s. you can delete this when you're done too. it's your config now! :)
--]]

-- set <space> as the leader key
-- see `:help mapleader`
--  note: must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- set to true if you have a nerd font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ setting options ]]
-- see `:help vim.o`
-- note: you can change these options as you wish!
--  for more options, you can see `:help option-list`

-- make line numbers default
vim.o.number = true
-- you can also add relative line numbers, to help with jumping.
--  experiment for yourself to see if you like it!
-- vim.o.relativenumber = true

-- enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"

-- don't show the mode, since it's already in the status line
vim.o.showmode = false

-- sync clipboard between os and neovim.
--  schedule the setting after `uienter` because it can increase startup-time.
--  remove this option if you want your os clipboard to remain independent.
--  see `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- case-insensitive searching unless \c or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- keep signcolumn on by default
vim.o.signcolumn = "yes"

-- decrease update time
vim.o.updatetime = 50

-- decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- sets how neovim will display certain whitespace characters in the editor.
--  see `:help 'list'`
--  and `:help 'listchars'`
--
--  notice listchars is set using `vim.opt` instead of `vim.o`.
--  it is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   see `:help lua-options`
--   and `:help lua-guide-options`
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- preview substitutions live, as you type!
vim.o.inccommand = "split"

-- show which line your cursor is on
vim.o.cursorline = true

-- minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- see `:help 'confirm'`
vim.o.confirm = true

-- no swap or backup files (use persistent undo instead)
vim.o.swapfile = false
vim.o.backup = false
-- vim.opt.undodir = os.getenv("home") .. "/.vim/undo-dir"
vim.opt.undodir = vim.fn.expand("~/.vim/undo-dir")

-- [[ basic keymaps ]]
--  see `:help vim.keymap.set()`

-- clear highlights on search when pressing <esc> in normal mode
--  see `:help hlsearch`
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
-- diagnostic config & keymaps
-- see :help vim.diagnostic.opts
vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.error },

	-- can switch between these as you prefer
	virtual_text = true, -- text shows up at the end of the line
	virtual_lines = false, -- teest shows up underneath the line, with virtual lines

	-- auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
	jump = { float = true },
})

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "open diagnostic [q]uickfix list" })

-- exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. otherwise, you normally need to press <c-\><c-n>, which
-- is not what someone will guess without a bit more experience.
--
-- note: this won't work in all terminal emulators/tmux/etc. try your own mapping
-- or just use <c-\><c-n> to exit terminal mode
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "exit terminal mode" })

-- tip: disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "use h to move!!"<cr>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "use l to move!!"<cr>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "use k to move!!"<cr>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "use j to move!!"<cr>')

-- keybinds to make split navigation easier.
--  use ctrl+<hjkl> to switch between windows
--
--  see `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<c-h>", "<c-w><c-h>", { desc = "move focus to the left window" })
vim.keymap.set("n", "<c-l>", "<c-w><c-l>", { desc = "move focus to the right window" })
vim.keymap.set("n", "<c-j>", "<c-w><c-j>", { desc = "move focus to the lower window" })
vim.keymap.set("n", "<c-k>", "<c-w><c-k>", { desc = "move focus to the upper window" })

-- note: some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<c-s-h>", "<c-w>h", { desc = "move window to the left" })
-- vim.keymap.set("n", "<c-s-l>", "<c-w>l", { desc = "move window to the right" })
-- vim.keymap.set("n", "<c-s-j>", "<c-w>j", { desc = "move window to the lower" })
-- vim.keymap.set("n", "<c-s-k>", "<c-w>k", { desc = "move window to the upper" })

-- [[ basic autocommands ]]
--  see `:help lua-guide-autocommands`

-- highlight when yanking (copying) text
--  try it with `yap` in normal mode
--  see `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("textyankpost", {
	desc = "highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- autosave when leaving insert mode or switching focus
vim.api.nvim_create_autocmd({ "insertleave", "focuslost", "bufleave" }, {
	desc = "autosave on insert leave / focus lost",
	group = vim.api.nvim_create_augroup("autosave", { clear = true }),
	callback = function()
		if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
			vim.cmd("silent! write")
		end
	end,
})

-- [[ install `lazy.nvim` plugin manager ]]
--    see `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ configure and install plugins ]]
--
--  to check the current status of your plugins, run
--    :lazy
--
--  you can press `?` in this menu for help. use `:q` to close the window
--
--  to update plugins you can run
--    :lazy update
--
-- note: here is where you install your plugins.
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")
require("lazy").setup({
	-- note: plugins can be added via a link or github org/name. to run setup automatically, use `opts = {}`
	{ "nmac427/guess-indent.nvim", opts = {} },

	-- alternatively, use `config = function() ... end` for full control over the configuration.
	-- if you prefer to call `setup` explicitly, use:
	--    {
	--        'lewis6991/gitsigns.nvim',
	--        config = function()
	--            require('gitsigns').setup({
	--                -- your gitsigns configuration here
	--            })
	--        end,
	--    }
	--
	-- here is a more advanced example where we pass configuration
	-- options to `gitsigns.nvim`.
	--
	-- see `:help gitsigns` to understand what the configuration keys do
	{ -- adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- note: plugins can also be configured to run lua code when they are loaded.
	--
	-- this is often very useful to both group configuration, as well as handle
	-- lazy loading plugins that don't need to be loaded immediately at startup.
	--
	-- for example, in the following configuration, we use:
	--  event = 'VimEnter'
	--
	-- which loads which-key before all the ui elements are loaded. events can be
	-- normal autocommands events (`:help autocmd-events`).
	--
	-- then, because we use the `opts` key (recommended), the configuration runs
	-- after the plugin has been loaded as `require(module).setup(opts)`.

	{ -- useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter",
		opts = {
			-- delay between pressing a key and opening which-key (milliseconds)
			delay = 0,
			icons = { mappings = vim.g.have_nerd_font },

			-- document existing key chains
			spec = {
				{ "<leader>s", group = "[s]earch", mode = { "n", "v" } },
				{ "<leader>t", group = "[t]oggle" },
				{ "<leader>h", group = "git [h]unk", mode = { "n", "v" } },
				{ "<leader>p", group = "[p]roject" },
			},
		},
	},

	-- note: plugins can specify dependencies.
	--
	-- the dependencies are proper plugin specifications as well - anything
	-- you do for a plugin at the top level, you can do for a dependency.
	--
	-- use the `dependencies` key to specify the dependencies of a particular plugin

	{ -- fuzzy finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		-- by default, telescope is included and acts as your picker for everything.

		-- if you would like to switch to a different picker (like snacks, or fzf-lua)
		-- you can disable the telescope plugin by setting enabled to false and enable
		-- your replacement picker by requiring it explicitly (e.g. 'custom.plugins.snacks')

		-- note: if you customize your config for yourself,
		-- it’s best to remove the telescope plugin config entirely
		-- instead of just disabling it here, to keep your config clean.
		enabled = true,
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- if encountering errors, see telescope-fzf-native readme for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- this is only run then, not every time neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- useful for getting pretty icons, but requires a nerd font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! it's more than just a "file finder", it can search
			-- many different aspects of neovim, your workspace, lsp, and more!
			--
			-- the easiest way to use telescope, is to start by doing something like:
			--  :telescope help_tags
			--
			-- after running this command, a window will open up and you're able to
			-- type in the prompt window. you'll see a list of `help_tags` options and
			-- a corresponding preview of the help.
			--
			-- two important keymaps to use while in telescope are:
			--  - insert mode: <c-/>
			--  - normal mode: ?
			--
			-- this opens a window that shows you all of the keymaps for the current
			-- telescope picker. this is really useful to discover what telescope can
			-- do as well as how to actually do it!

			-- [[ configure telescope ]]
			-- see `:help telescope` and `:help telescope.setup()`
			require("telescope").setup({
				defaults = {
					mappings = {
						i = { ["<cr>"] = require("telescope.actions").select_default },
					},
				},
				-- pickers = {}
				extensions = {
					["ui-select"] = { require("telescope.themes").get_dropdown() },
				},
			})

			-- enable telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- see `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[s]earch [h]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[s]earch [k]eymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[s]earch [f]iles" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[s]earch [s]elect telescope" })
			vim.keymap.set({ "n", "v" }, "<leader>sw", builtin.grep_string, { desc = "[s]earch current [w]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[s]earch by [g]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[s]earch [d]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[s]earch [r]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[s]earch recent files ("." for repeat)' })
			vim.keymap.set("n", "<leader>sc", builtin.commands, { desc = "[s]earch [c]ommands" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] find existing buffers" })

			-- this runs on lsp attach per buffer (see main lsp attach function in 'neovim/nvim-lspconfig' config for more info,
			-- it is better explained there). this allows easily switching between pickers if you prefer using something else!
			vim.api.nvim_create_autocmd("lspattach", {
				group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
				callback = function(event)
					local buf = event.buf

					-- find references for the word under your cursor.
					vim.keymap.set("n", "grr", builtin.lsp_references, { buffer = buf, desc = "[g]oto [r]eferences" })

					-- jump to the implementation of the word under your cursor.
					-- useful when your language has ways of declaring types without an actual implementation.
					vim.keymap.set(
						"n",
						"gri",
						builtin.lsp_implementations,
						{ buffer = buf, desc = "[g]oto [i]mplementation" }
					)

					-- jump to the definition of the word under your cursor.
					-- this is where a variable was first declared, or where a function is defined, etc.
					-- to jump back, press <c-t>.
					vim.keymap.set("n", "grd", builtin.lsp_definitions, { buffer = buf, desc = "[g]oto [d]efinition" })

					-- fuzzy find all the symbols in your current document.
					-- symbols are things like variables, functions, types, etc.
					vim.keymap.set(
						"n",
						"go",
						builtin.lsp_document_symbols,
						{ buffer = buf, desc = "open document symbols" }
					)

					-- fuzzy find all the symbols in your current workspace.
					-- similar to document symbols, except searches over your entire project.
					vim.keymap.set(
						"n",
						"gw",
						builtin.lsp_dynamic_workspace_symbols,
						{ buffer = buf, desc = "open workspace symbols" }
					)

					-- jump to the type of the word under your cursor.
					-- useful when you're not sure what type a variable is and you want to see
					-- the definition of its *type*, not where it was *defined*.
					vim.keymap.set(
						"n",
						"grt",
						builtin.lsp_type_definitions,
						{ buffer = buf, desc = "[g]oto [t]ype definition" }
					)
				end,
			})

			-- override default behavior and theme when searching
			vim.keymap.set("n", "<leader>/", function()
				-- you can pass additional configuration to telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] fuzzily search in current buffer" })

			-- it's also possible to pass additional configuration options.
			--  see `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "live grep in open files",
				})
			end, { desc = "[s]earch [/] in open files" })

			-- shortcut for searching your neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[s]earch [n]eovim files" })
		end,
	},

	-- lsp plugins
	{
		-- main lsp configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			-- automatically install lsps and related tools to stdpath for neovim
			-- mason must be loaded before its dependents so we need to set it up here.
			-- note: `opts = {}` is the same as calling `require('mason').setup({})`
			{ "mason-org/mason.nvim", opts = {} },
			"whoissethdaniel/mason-tool-installer.nvim",

			-- useful status updates for lsp.
			{ "j-hui/fidget.nvim", opts = {} },

			-- allows extra capabilities provided by blink.cmp
			"saghen/blink.cmp",
		},
		config = function()
			-- brief aside: **what is lsp?**
			--
			-- lsp is an initialism you've probably heard, but might not understand what it is.
			--
			-- lsp stands for language server protocol. it's a protocol that helps editors
			-- and language tooling communicate in a standardized fashion.
			--
			-- in general, you have a "server" which is some tool built to understand a particular
			-- language (such as `gopls`, `lua-language-server`, `rust_analyzer`, etc.). these language servers
			-- (sometimes called lsp servers, but that's kind of like atm machine) are standalone
			-- processes that communicate with some "client" - in this case, neovim!
			--
			-- lsp provides neovim with features like:
			--  - go to definition
			--  - find references
			--  - autocompletion
			--  - symbol search
			--  - and more!
			--
			-- thus, language servers are external tools that must be installed separately from
			-- neovim. this is where `mason` and related plugins come into play.
			--
			-- if you're wondering about lsp vs treesitter, you can check out the wonderfully
			-- and elegantly composed help section, `:help lsp-vs-treesitter`

			--  this function gets run when an lsp attaches to a particular buffer.
			--    that is to say, every time a new file is opened that is associated with
			--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
			--    function will be executed to configure the current buffer
			vim.api.nvim_create_autocmd("lspattach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- note: remember that lua is a real programming language, and as such it is possible
					-- to define small helper and utility functions so you don't have to repeat yourself.
					--
					-- in this case, we create a function that lets us more easily define mappings specific
					-- for lsp related items. it sets the mode, buffer and description for us each time.
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "lsp: " .. desc })
					end

					-- rename the variable under your cursor.
					--  most language servers support renaming across files, etc.
					map("grn", vim.lsp.buf.rename, "[r]e[n]ame")

					-- execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your lsp for this to activate.
					map("gra", vim.lsp.buf.code_action, "[g]oto code [a]ction", { "n", "x" })

					-- warn: this is not goto definition, this is goto declaration.
					--  for example, in c this would take you to the header.
					map("grd", vim.lsp.buf.declaration, "[g]oto [d]eclaration")

					-- the following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    see `:help cursorhold` for information about when this is executed
					--
					-- when you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client:supports_method("textdocument/documenthighlight", event.buf) then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "cursorhold", "cursorholdi" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "cursormoved", "cursormovedi" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("lspdetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- the following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- this may be unwanted, since they displace some of your code
					if client and client:supports_method("textdocument/inlayhint", event.buf) then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[t]oggle inlay [h]ints")
					end
				end,
			})

			-- lsp servers and clients are able to communicate to each other what features they support.
			--  by default, neovim doesn't support everything that is in the lsp specification.
			--  when you add blink.cmp, luasnip, etc. neovim now has *more* capabilities.
			--  so, we create new capabilities with blink.cmp, and then broadcast that to the servers.
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- enable the following language servers
			--  feel free to add/remove any lsps that you want here. they will automatically be installed.
			--  see `:help lsp-config` for information about keys and how to configure
			local servers = {
				-- clangd = {},
				-- gopls = {},
				-- pyright = {},
				-- rust_analyzer = {},
				--
				-- some languages (like typescript) have entire language plugins that can be useful:
				--    https://github.com/pmizio/typescript-tools.nvim
				--
				-- but for many setups, the lsp (`ts_ls`) will work just fine
				-- ts_ls = {},
			}

			-- ensure the servers and tools above are installed
			--
			-- to check the current status of installed tools and/or manually install
			-- other tools, you can run
			--    :mason
			--
			-- you can press `g?` for help in this menu.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"lua-language-server", -- lua language server
				"stylua", -- used to format lua code
				"prettierd", -- js/ts/svelte formatter
				"eslint_d", -- js/ts linter
				"cljfmt", -- clojure formatter
				"clojure-lsp", -- clojure lsp
				"svelte-language-server", -- svelte lsp
				"typescript-language-server", -- js/ts lsp
				"eslint-lsp", -- eslint lsp
			})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			for name, server in pairs(servers) do
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				vim.lsp.config(name, server)
				vim.lsp.enable(name)
			end
			vim.lsp.enable("clojure_lsp")
			vim.lsp.enable("svelte")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("eslint")

			-- special lua config, as recommended by neovim help docs
			vim.lsp.config("lua-language-server", {
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if
							path ~= vim.fn.stdpath("config")
							and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
						then
							return
						end
					end

					client.config.settings.lua = vim.tbl_deep_extend("force", client.config.settings.lua, {
						runtime = {
							version = "luajit",
							path = { "lua/?.lua", "lua/?/init.lua" },
						},
						workspace = {
							checkthirdparty = false,
							-- note: this is a lot slower and will cause issues when working on your own configuration.
							--  see https://github.com/neovim/nvim-lspconfig/issues/3189
							library = vim.api.nvim_get_runtime_file("", true),
						},
					})
				end,
				settings = {
					lua = {},
				},
			})
			vim.lsp.enable("lua-language-server")
		end,
	},

	{ -- autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[f]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. you can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return nil
				else
					return {
						timeout_ms = 500,
						lsp_format = "fallback",
					}
				end
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				svelte = { "prettierd" },
				clojure = { "cljfmt" },
			},
		},
	},

	{ -- autocompletion
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			-- snippet engine
			{
				"l3mon4d3/luasnip",
				version = "2.*",
				build = (function()
					-- build step is needed for regex support in snippets.
					-- this step is not supported in many windows environments.
					-- remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    see the readme about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
				opts = {},
			},
		},
		--- @module 'blink.cmp'
		--- @type blink.cmp.config
		opts = {
			keymap = {
				-- 'default' (recommended) for mappings similar to built-in completions
				--   <c-y> to accept ([y]es) the completion.
				--    this will auto-import if your lsp supports it.
				--    this will expand snippets if the lsp sent a snippet.
				-- 'super-tab' for tab to accept
				-- 'enter' for enter to accept
				-- 'none' for no mappings
				--
				-- for an understanding of why the 'default' preset is recommended,
				-- you will need to read `:help ins-completion`
				--
				-- no, but seriously. please read `:help ins-completion`, it is really good!
				--
				-- all presets have the following mappings:
				-- <tab>/<s-tab>: move to right/left of your snippet expansion
				-- <c-space>: open menu or open docs if already open
				-- <c-n>/<c-p> or <up>/<down>: select next/previous item
				-- <c-e>: hide menu
				-- <c-k>: toggle signature help
				--
				-- see :h blink-cmp-config-keymap for defining your own keymap
				preset = "default",

				-- for more advanced luasnip keymaps (e.g. selecting choice nodes, expansion) see:
				--    https://github.com/l3mon4d3/luasnip?tab=readme-ov-file#keymaps
			},

			appearance = {
				-- 'mono' (default) for 'nerd font mono' or 'normal' for 'nerd font'
				-- adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			completion = {
				-- by default, you may press `<c-space>` to show the documentation.
				-- optionally, set `auto_show = true` to show the documentation after a delay.
				documentation = { auto_show = false, auto_show_delay_ms = 500 },
			},

			sources = {
				default = { "lsp", "path", "snippets" },
			},

			snippets = { preset = "luasnip" },

			-- blink.cmp includes an optional, recommended rust fuzzy matcher,
			-- which automatically downloads a prebuilt binary when enabled.
			--
			-- by default, we use the lua implementation instead, but you may enable
			-- the rust implementation via `'prefer_rust_with_warning'`
			--
			-- see :h blink-cmp-config-fuzzy for more information
			fuzzy = { implementation = "lua" },

			-- shows a signature help window while you type arguments for a function
			signature = { enabled = true },
		},
	},

	{ -- you can easily change to a different colorscheme.
		-- change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- if you want to see what colorschemes are already installed, you can use `:telescope colorscheme`.
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({
				styles = {
					comments = { italic = false }, -- disable italics in comments
				},
			})

			-- load the colorscheme here.
			-- like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},

	-- highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ -- collection of various small independent plugins/modules
		"nvim-mini/mini.nvim",
		config = function()
			-- better around/inside textobjects
			--
			-- examples:
			--  - va)  - [v]isually select [a]round [)]paren
			--  - yinq - [y]ank [i]nside [n]ext [q]uote
			--  - ci'  - [c]hange [i]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [s]urround [a]dd [i]nner [w]ord [)]paren
			-- - sd'   - [s]urround [d]elete [']quotes
			-- - sr)'  - [s]urround [r]eplace [)] [']
			require("mini.surround").setup()

			-- ... and there is more!
			--  check out: https://github.com/nvim-mini/mini.nvim
		end,
	},

	{ -- highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		config = function()
			local filetypes = {
				"bash",
				"c",
				"clojure",
				"diff",
				"html",
				"javascript",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"svelte",
				"typescript",
				"vim",
				"vimdoc",
			}
			require("nvim-treesitter").install(filetypes)
			vim.api.nvim_create_autocmd("filetype", {
				pattern = filetypes,
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},

	-- the following comments only work if you have downloaded the kickstart repo, not just copy pasted the
	-- init.lua. if you want these files, they are in the repository, so you can just download them and
	-- place them in the correct locations.

	-- note: next step on your neovim journey: add/configure additional plugins for kickstart
	--
	--  here are some example plugins that i've included in the kickstart repository.
	--  uncomment any of the lines below to enable them (you will need to restart nvim).
	--
	-- require 'kickstart.plugins.debug',
	-- require 'kickstart.plugins.indent_line',
	-- require 'kickstart.plugins.lint',
	-- require 'kickstart.plugins.autopairs',
	-- require 'kickstart.plugins.neo-tree',
	-- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

	-- autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- file tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"muniftanjim/nui.nvim",
		},
		keys = {
			{ "<leader>n", "<cmd>Neotree toggle<CR>", desc = "Toggle file tree" },
		},
	},

	-- clipboard
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {
			default = {
				dir_path = "images",
			},
		},
		keys = {
			{
				"<leader>p",
				function()
					require("img-clip").paste_image()
				end,
				desc = "Paste image from clipboard",
			},
		},
	},

	-- lazygit
	{
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
		keys = {
			{ "<leader>g", ":LazyGit<CR>", desc = "[g]it lazygit" },
		},
	},
	-- lualine statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
					section_separators = "",
					component_separators = "",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { { "filename", path = 1 } },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},

	-- clojure: repl with conjure
	{
		"olical/conjure",
		dependencies = { "olical/nfnl" },
		ft = { "clojure" },
		init = function()
			-- use "," as conjure's mapping prefix so it doesn't conflict with <leader>s* (telescope)
			vim.g["conjure#mapping#prefix"] = ","
		end,
		config = function()
			vim.keymap.set(
				"n",
				"<leader>ee",
				":conjureeval<cr>",
				{ noremap = true, silent = true, desc = "[e]val expression" }
			)
		end,
	},

	-- clojure: structural editing
	{
		"guns/vim-sexp",
		ft = { "clojure" },
		init = function()
			vim.g.sexp_enable_insert_mode_mappings = 0
		end,
	},
	{
		"tpope/vim-sexp-mappings-for-regular-people",
		ft = { "clojure" },
		dependencies = { "guns/vim-sexp" },
	},

	-- markdown
	{
		"hedyhli/outline.nvim",
		cmd = { "Outline", "OutlineOpen" },
		keys = {
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		config = function()
			require("outline").setup()
		end,
	},

	-- note: the import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    this is the easiest way to modularize your config.
	--
	--  uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	{ import = "custom.plugins" },
	--
	-- for additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
	-- or use telescope!
	-- in normal mode type `<space>sh` then write `lazy.nvim-plugin`
	-- you can continue same window with `<space>sr` which resumes last telescope search

	{ -- per-directory session auto-save/restore
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
		keys = {
			{ "<leader>ps", function() require("persistence").load() end, desc = "[p]roject [s]ession restore (cwd)" },
			{ "<leader>pl", function() require("persistence").load({ last = true }) end, desc = "[p]roject [l]ast session" },
			{ "<leader>pd", function() require("persistence").stop() end, desc = "[p]roject [d]on't save on exit" },
		},
	},

	{ -- project picker over ~/repos/*; loads session on switch
		"nvim-telescope/telescope-project.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		keys = {
			{
				"<leader>pp",
				function()
					require("telescope").extensions.project.project({
						display_type = "full",
					})
				end,
				desc = "[p]roject [p]icker",
			},
		},
		config = function()
			require("telescope").setup({
				extensions = {
					project = {
						base_dirs = { { path = "~/repos", max_depth = 2 } },
						hidden_files = false,
						order_by = "recent",
						-- on enter: cd to project, then try restoring its session
						on_project_selected = function(prompt_bufnr)
							require("telescope._extensions.project.actions").change_working_directory(prompt_bufnr, false)
							require("persistence").load()
						end,
					},
				},
			})
			require("telescope").load_extension("project")
		end,
	},
}, {
	rocks = { enabled = false },
	ui = {
		-- if you are using a nerd font: set icons to an empty table which will use the
		-- default lazy.nvim defined nerd font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- the line beneath this is called `modeline`. see `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
