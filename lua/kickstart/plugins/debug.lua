return {
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    keys = {
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Toggle Breakpoint',
      },

      {
        '<leader>dc',
        function()
          require('dap').continue()
        end,
        desc = 'Continue',
      },

      {
        '<leader>dC',
        function()
          require('dap').run_to_cursor()
        end,
        desc = 'Run to Cursor',
      },

      {
        '<leader>dT',
        function()
          require('dap').terminate()
        end,
        desc = 'Terminate',
      },
    },
    config = function()
      vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    config = true,
    keys = {
      {
        '<leader>du',
        function()
          require('dapui').toggle {}
        end,
        desc = 'Dap UI',
      },
    },
    dependencies = {
      -- keep-sorted start block=yes
      {
        'jay-babu/mason-nvim-dap.nvim',
        ---@type MasonNvimDapSettings
        opts = {
          handlers = {},
          automatic_installation = false,
          -- No adapters are installed automatically.
          ensure_installed = {},
        },
        dependencies = {
          'mfussenegger/nvim-dap',
          'mason-org/mason.nvim',
        },
      },
      -- Retained for future Python debugging; currently disabled.
      {
        'mfussenegger/nvim-dap-python',
        enabled = false,
        lazy = true,
        config = function()
          require('dap-python').setup 'python'
        end,
        dependencies = {
          'mfussenegger/nvim-dap',
        },
      },
      {
        'nvim-neotest/nvim-nio',
      },
      {
        'theHamsta/nvim-dap-virtual-text',
        config = true,
        dependencies = {
          'mfussenegger/nvim-dap',
        },
      },
      -- keep-sorted end
    },
  },
}
