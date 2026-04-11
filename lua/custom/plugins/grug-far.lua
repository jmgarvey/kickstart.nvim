return {
  {
    'MagicDuck/grug-far.nvim',
    cmd = { 'GrugFar', 'GrugFarWithin' },
    keys = {
      {
        '<leader>sR',
        function()
          require('grug-far').open {
            transient = true,
            instanceName = 'replace',
            staticTitle = 'Grug Find and Replace',
          }
        end,
        desc = '[S]earch [R]eplace (grug)',
      },
      {
        '<leader>sW',
        function()
          require('grug-far').open {
            transient = true,
            instanceName = 'replace',
            staticTitle = 'Grug Find and Replace',
            prefills = { search = vim.fn.expand '<cword>' },
          }
        end,
        desc = '[S]earch current [W]ord (grug)',
      },
      {
        '<leader>sc',
        function()
          require('grug-far').open {
            transient = true,
            instanceName = 'replace',
            staticTitle = 'Grug Find and Replace',
            prefills = { paths = vim.fn.expand '%' },
          }
        end,
        desc = '[S]earch [C]urrent file (grug)',
      },
      {
        '<leader>sv',
        function()
          require('grug-far').open {
            transient = true,
            staticTitle = 'Grug Find and Replace',
            visualSelectionUsage = 'operate-within-range',
          }
        end,
        mode = { 'n', 'x' },
        desc = '[S]earch in [V]isual range (grug)',
      },
    },
    opts = {},
  },
}
