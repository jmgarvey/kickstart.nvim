return {
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python', --optional
    },
    ft = 'python',
    opts = {
      search = {},
      options = {
        picker = 'snacks',
      },
    },
    --config = function()
    --  require('venv-selector').setup()
    --end,
    keys = {
      { ',v', '<cmd>VenvSelect<cr>', desc = 'Virtual Environments' },
    },
  },
}
