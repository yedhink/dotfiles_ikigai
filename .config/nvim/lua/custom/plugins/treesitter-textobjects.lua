return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  config = function()
    require('nvim-treesitter.configs').setup {
      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ['<leader>nb'] = '@block.outer',
            ['<leader>nf'] = '@function.outer',
            ['<leader>nc'] = '@class.outer',
            ['<leader>ni'] = '@conditional.outer',
            ['<leader>nl'] = '@loop.outer',
          },
          goto_next_end = {
            ['<leader>nB'] = '@block.outer',
            ['<leader>nF'] = '@function.outer',
            ['<leader>nC'] = '@class.outer',
            ['<leader>nI'] = '@conditional.outer',
            ['<leader>nL'] = '@loop.outer',
          },
          goto_previous_start = {
            ['<leader>pb'] = '@block.outer',
            ['<leader>pf'] = '@function.outer',
            ['<leader>pc'] = '@class.outer',
            ['<leader>pi'] = '@conditional.outer',
            ['<leader>pl'] = '@loop.outer',
          },
          goto_previous_end = {
            ['<leader>pB'] = '@block.outer',
            ['<leader>pF'] = '@function.outer',
            ['<leader>pC'] = '@class.outer',
            ['<leader>pI'] = '@conditional.outer',
            ['<leader>pL'] = '@loop.outer',
          },
        },
      },
    }
  end,
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
}
