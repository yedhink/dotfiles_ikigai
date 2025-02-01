return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      indent = { char = '▏' },
      scope = { show_start = false, show_end = false },
      exclude = {
        buftypes = {
          'nofile',
          'prompt',
          'quickfix',
          'terminal',
        },
        filetypes = {
          'aerial',
          'alpha',
          'dashboard',
          'help',
          'lazy',
          'mason',
          'neo-tree',
          'NvimTree',
          'neogitstatus',
          'notify',
          'startify',
          'toggleterm',
          'Trouble',
        },
      },
    },
  },
}
