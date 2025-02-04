-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- ****************************** UI Configuration ******************************
-- show symbol indicating wrap
vim.o.showbreak = '└─▶'
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
-- ******************************************************************************

-- ****************************** Editor Behavior ******************************
vim.opt.inccommand = 'nosplit'
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
-- Enable break indent
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Decrease update time
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shell = 'zsh --no-rcs --no-globalrcs'
-- *****************************************************************************

-- ****************************** Diagnostics ******************************
-- Don't show diagnostic signs in signcolumn
vim.diagnostic.config {
  signs = false,
}
-- *************************************************************************

-- ****************************** Filetype Handling ******************************
vim.filetype.add {
  extension = {
    mdx = 'markdown',
  },
}
vim.g.markdown_folding = 1
-- *******************************************************************************

-- ****************************** Keymaps ******************************
--  See `:help vim.keymap.set()`
-- Set the global variable for multi-cursor pattern
vim.g.mc = 'y/\\V\x12=escape(@", "/")\r\r'
-- Normal mode mappings
vim.keymap.set('n', 'cn', '*``cgn', { noremap = true })
vim.keymap.set('n', 'cN', '*``cgN', { noremap = true })
-- Visual mode expression mappings
vim.keymap.set('v', 'cn', function()
  return vim.g.mc .. '``cgn'
end, { expr = true, noremap = true })
vim.keymap.set('v', 'cN', function()
  return vim.g.mc .. '``cgN'
end, { expr = true, noremap = true })
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Keybinding to toggle inline diagnostics (ii)
vim.api.nvim_set_keymap('n', '<leader>ti', ':lua vim.cmd("DiagnosticsToggleVirtualText")<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-e>', '<cmd>lua vim.diagnostic.open_float()<cr>')
-- Buffer Management
vim.keymap.set('n', ']b', '<cmd>BufferNext<CR>')
vim.keymap.set('n', '[b', '<cmd>BufferPrev<CR>')
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- *********************************************************************

-- ****************************** Autocommands ******************************
--  See `:help lua-guide-autocommands`
local function augroup(name)
  return vim.api.nvim_create_augroup('yedhins-' .. name, { clear = true })
end
--
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup 'yedhins-highlight-yank',
  callback = function()
    vim.highlight.on_yank()
  end,
})
--
-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = augroup 'auto_create_dir',
  callback = function(event)
    if event.match:match '^%w%w+:[\\/][\\/]' then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})
--
-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup 'last_loc',
  callback = function(event)
    local exclude = { 'gitcommit' }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
--
-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'close_with_q',
  pattern = {
    'PlenaryTestPopup',
    'checkhealth',
    'dbout',
    'gitsigns-blame',
    'grug-far',
    'help',
    'lspinfo',
    'neotest-output',
    'neotest-output-panel',
    'neotest-summary',
    'notify',
    'qf',
    'spectre_panel',
    'startuptime',
    'tsplayground',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set('n', 'q', function()
        vim.cmd 'close'
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = 'Quit buffer',
      })
    end)
  end,
})
--
-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'man_unlisted',
  pattern = { 'man' },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
})
--
-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'wrap_spell',
  pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
--
-- Command to toggle inline diagnostics
vim.api.nvim_create_user_command('DiagnosticsToggleVirtualText', function()
  local current_value = vim.diagnostic.config().virtual_text
  if current_value then
    vim.diagnostic.config { virtual_text = false }
  else
    vim.diagnostic.config { virtual_text = true }
  end
end, {})
-- ********************************************************************************

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- Use `opts = {}` to force a plugin to be loaded.

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the which-key configuration, we use:
  --  event = 'VimEnter'
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },

  { 'Bilal2453/luvit-meta', lazy = true },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Breadcrumbs which helps us get context of where we are within a file
  {
    'Bekaboo/dropbar.nvim',
    config = function()
      local dropbar_api = require 'dropbar.api'
      vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current dropbar context' })
      vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next dropbar context' })
    end,
  },

  -- Simple status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {}
    end,
  },

  -- Need the tpope energy!
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  -- Restore sesh when we open neovim in a dir
  {
    'rmagatti/auto-session',
    lazy = false,
    auto_create = function()
      local home = os.getenv 'HOME'
      local cwd = vim.fn.getcwd()
      local is_git_repo = vim.fn.system 'git rev-parse --is-inside-work-tree' == 'true\n'
      local is_dev_project = cwd:find(home .. '/dev', 1, true) == 1
      local is_config_dir = cwd:find(home .. '/.config', 1, true) == 1
      return is_git_repo or is_dev_project or is_config_dir
    end,
    opts = {
      enabled = true,
    },
  },

  {
    -- Better quick fix window
    'kevinhwang91/nvim-bqf',
    lazy = false,
    opts = {
      auto_enable = true,
      auto_resize_height = true, -- highly recommended enable
      preview = {
        win_height = 12,
        win_vheight = 12,
        delay_syntax = 80,
        show_title = false,
      },
    },
  },

  -- Display colors if hex codes are present. Run: ColorizerToggle
  {
    'norcalli/nvim-colorizer.lua',
  },

  -- Text object exchange movement. Useful when swapping arguments.
  {
    'gbprod/substitute.nvim',
    keys = {
      {
        'X',
        function()
          require('substitute.exchange').visual()
        end,
        mode = 'x',
      },
    },
    config = function()
      require('substitute').setup {}
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = true, -- Auto close on trailing </
      }
    end,
  },

  require 'custom/plugins/which-key',
  -- LSP logic, servers etc
  require 'custom/plugins/lspconfig',
  -- Auto formatting
  require 'custom/plugins/conform',
  -- Auto completion and LSP completions
  require 'custom/plugins/cmp',
  -- Right now just using the "ai" plugin for
  -- manipulating text around/inside objects.
  -- Maybe it should be installed as a
  -- standalone plugin!
  require 'custom/plugins/mini',
  -- Treesitter and related plugins
  require 'custom/plugins/treesitter',
  require 'custom/plugins/treesitter-context',
  require 'custom/plugins/treesitter-textobjects',
  require 'custom/plugins/yazi',
  -- Tab bar and related config
  require 'custom/plugins/barbar',
  -- Global search and replace
  require 'custom/plugins/spectre',
  -- FZF-based fuzzy finder
  require 'custom/plugins/fzf',
  -- Visual indent guides
  require 'custom/plugins/indent_line',
  require 'custom/plugins/autopairs',
  require 'custom/plugins/gitsigns',
  -- Colorscheme
  require 'custom/plugins/kanagawa',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
