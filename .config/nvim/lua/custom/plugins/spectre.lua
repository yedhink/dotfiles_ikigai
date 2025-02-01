return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('spectre').setup {
      replace_engine = {
        ['sd'] = {
          cmd = 'sd',
          options = {},
        },
      },
      default = {
        find = {
          --pick one of item in find_engine
          cmd = 'rg',
          options = { 'ignore-case' },
        },
        replace = {
          --pick one of item in replace_engine
          cmd = 'sd',
        },
      },
    }
  end,
}
