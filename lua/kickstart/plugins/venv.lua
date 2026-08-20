return {
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python', -- Disabled globally; retained for future DAP integration.
    },
    ft = 'python',
    opts = {
      search = {},
      options = {
        picker = 'snacks',
      },
    },
    keys = {
      { ',v', '<cmd>VenvSelect<cr>', desc = 'Virtual Environments' },
    },
  },
}
