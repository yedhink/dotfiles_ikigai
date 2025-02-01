return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local fzf_lua = require 'fzf-lua'
    fzf_lua.setup {
      winopts = {
        -- preview = {
        --   hidden = 'hidden',
        -- },
      },
      -- files = {
      --   fd_opts = '--color=never --type f --hidden --follow --exclude .git',
      -- },
      -- grep = {
      --   rg_opts = '--column --line-number --no-heading --color=always --smart-case --hidden -g "!.git/"',
      -- },
      -- keymap = {
      --   builtin = {
      --     ['<C-f>'] = 'toggle-fullscreen',
      --     ['<C-r>'] = 'toggle-preview-wrap',
      --     ['<C-p>'] = 'toggle-preview',
      --     ['<C-d>'] = 'preview-page-down',
      --     ['<C-u>'] = 'preview-page-up',
      --   },
      -- },
    }
    -- Keymaps
    vim.keymap.set('n', '<leader>sh', fzf_lua.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', fzf_lua.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>ff', function()
      fzf_lua.files { cmd = 'fd --type f --hidden --exclude .git' }
    end, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sw', fzf_lua.grep_cword, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>/', fzf_lua.live_grep_native, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', fzf_lua.diagnostics_document, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', fzf_lua.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', fzf_lua.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>bl', fzf_lua.buffers, { desc = '[ ] Find existing buffers' })
    -- Search Neovim config files
    vim.keymap.set('n', '<leader>sn', function()
      fzf_lua.files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
    vim.keymap.set('n', '<leader>fed', function()
      vim.cmd('edit ' .. vim.fn.stdpath 'config' .. '/init.lua')
    end, { desc = 'Open Neovim config' })
  end,
}
