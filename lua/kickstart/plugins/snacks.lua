---@diagnostic disable: undefined-global
return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        preset = {
          keys = {
            { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            -- { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
            { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            -- { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
          },
        },
      },
      notifier = {},
      image = {},
      picker = {
        layout = { preset = 'v1' },
        layouts = {
          v1 = {
            layout = {
              backdrop = true,
              width = 0.9,
              min_width = 80,
              height = 0.95,
              min_height = 30,
              box = 'vertical',
              border = false,
              --title = '{title} {live} {flags}',
              --title_pos = 'center',
              { win = 'preview', title = '{preview}', height = 0.5, border = true },
              { win = 'input', title = '{title} {live} {flags}', height = 1, border = true },
              { win = 'list', title = 'Results', border = true },
            },
          },
        },
      },
    },
    keys = {
      -- LSP - comment these out if using telescope as picker
      {
        'gd',
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = 'LSP: [G]oto [D]efinition',
      },
      {
        'gD',
        function()
          Snacks.picker.lsp_declarations()
        end,
        desc = 'LSP: [G]oto [D]eclaration',
      },
      {
        'gr',
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = 'LSP: [G]oto [R]eferences',
      },
      {
        'gI',
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = 'LSP: [G]oto [I]mplementation',
      },
      {
        '<leader>D',
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = 'LSP: Type [D]efinition',
      },
      -- {
      --   'gai',
      --   function()
      --     Snacks.picker.lsp_incoming_calls()
      --   end,
      --   desc = 'C[a]lls Incoming',
      -- },
      -- {
      --   'gao',
      --   function()
      --     Snacks.picker.lsp_outgoing_calls()
      --   end,
      --   desc = 'C[a]lls Outgoing',
      -- },
      {
        '<leader>ds',
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = 'LSP: [D]ocument [S]ymbols',
      },
      {
        '<leader>ws',
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = 'LSP: [W]orkspace [S]ymbols',
      },

      --picker
      {
        '<leader>sh',
        function()
          Snacks.picker.help()
        end,
        desc = '[S]earch [H]elp',
      },
      {
        '<leader>sk',
        function()
          Snacks.picker.keymaps()
        end,
        desc = '[S]earch [K]eymaps',
      },
      {
        '<leader>sf',
        function()
          Snacks.picker.files()
        end,
        desc = '[S]earch [F]iles',
      },
      {
        '<leader>sw',
        function()
          Snacks.picker.grep_word()
        end,
        desc = '[S]earch current [W]ord or visual selection',
        mode = { 'n', 'x' },
      },
      {
        '<leader>sg',
        function()
          Snacks.picker.grep()
        end,
        desc = '[S]earch by [G]rep',
      },
      {
        '<leader>sd',
        function()
          Snacks.picker.diagnostics()
        end,
        desc = '[S]earch [D]iagnostics',
      },
      {
        '<leader>sr',
        function()
          Snacks.picker.resume()
        end,
        desc = '[S]earch [R]esume',
      },
      {
        '<leader>s.',
        function()
          Snacks.picker.recent()
        end,
        desc = '[S]earch [.] Recent Files',
      },
      {
        '<leader><leader>',
        function()
          Snacks.picker.buffers { current = false, sort_lastused = true }
        end,
        desc = '[ ] Find existing buffers',
      },
      {
        '<leader>/',
        function()
          Snacks.picker.lines()
        end,
        desc = '[/] Search in current buffer',
      },
      {
        '<leader>s/',
        function()
          Snacks.picker.grep_buffers()
        end,
        desc = '[S]earch [/] in Open Buffers',
      },
      {
        '<leader>sn',
        function()
          Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
        end,
        desc = '[S]earch [N]eovim Config Files',
      },
      {
        '<leader>sp',
        function()
          Snacks.picker()
        end,
        desc = '[S]earch [P]ickers',
      },
      {
        '<leader>s"',
        function()
          Snacks.picker.registers()
        end,
        desc = '[S]earch ["] Registers',
      },
      {
        '<leader>sm',
        function()
          Snacks.picker.marks()
        end,
        desc = '[S]earch [M]arks',
      },
    },
  },
}
