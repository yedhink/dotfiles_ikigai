return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    local treesitter_context_api = require 'treesitter-context'
    treesitter_context_api.setup {
      enable = false,
    }
    vim.keymap.set('n', '[c', function()
      treesitter_context_api.go_to_context(vim.v.count1)
    end, { silent = true, desc = 'Goto start of context' })
    vim.keymap.set('n', '<leader>tc', function()
      treesitter_context_api.toggle()
    end, { silent = true, desc = 'Toggle context display' })
  end,
}
