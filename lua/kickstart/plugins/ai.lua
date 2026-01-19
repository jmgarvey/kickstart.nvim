return {

  {
    'NickvanDyke/opencode.nvim',
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { 'folke/snacks.nvim', opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true

      -- Recommended/example keymaps.
      vim.keymap.set({ 'n', 'x' }, '<leader>oa', function()
        require('opencode').ask('@this: ', { submit = true })
      end, { desc = '[O]pencode [A]sk about this' })
      vim.keymap.set({ 'n', 'x' }, '<leader>os', function()
        require('opencode').select()
      end, { desc = '[O]pencode [S]elect prompt' })
      vim.keymap.set({ 'n', 'x' }, '<leader>o+', function()
        require('opencode').prompt '@this'
      end, { desc = '[O]pencoe [+] this' })
      vim.keymap.set('n', '<leader>ot', function()
        require('opencode').toggle()
      end, { desc = '[O]pencode [T]oggle window' })
      vim.keymap.set({ 'n', 't' }, '<C-.>', function()
        require('opencode').toggle()
      end, { desc = 'Toggle opencode' })
      vim.keymap.set('n', '<leader>on', function()
        require('opencode').command 'session_new'
      end, { desc = '[O]pencode [N]ew session' })
      vim.keymap.set('n', '<leader>oi', function()
        require('opencode').command 'session_interrupt'
      end, { desc = '[O]pencode [I]nterrupt session' })
      vim.keymap.set('n', '<S-C-u>', function()
        require('opencode').command 'messages_half_page_up'
      end, { desc = 'Messages half page up' })
      vim.keymap.set('n', '<S-C-d>', function()
        require('opencode').command 'messages_half_page_down'
      end, { desc = 'Messages half page down' })

      -- Recommended/example keymaps.
      -- vim.keymap.set({ 'n', 'x' }, '<C-a>', function()
      --   require('opencode').ask('@this: ', { submit = true })
      -- end, { desc = 'Ask opencode' })
      -- vim.keymap.set({ 'n', 'x' }, '<C-x>', function()
      --   require('opencode').select()
      -- end, { desc = 'Execute opencode action…' })
      -- vim.keymap.set({ 'n', 't' }, '<C-.>', function()
      --   require('opencode').toggle()
      -- end, { desc = 'Toggle opencode' })
      --
      -- vim.keymap.set({ 'n', 'x' }, 'go', function()
      --   return require('opencode').operator '@this '
      -- end, { expr = true, desc = 'Add range to opencode' })
      -- vim.keymap.set('n', 'goo', function()
      --   return require('opencode').operator '@this ' .. '_'
      -- end, { expr = true, desc = 'Add line to opencode' })
      --
      -- vim.keymap.set('n', '<S-C-u>', function()
      --   require('opencode').command 'session.half.page.up'
      -- end, { desc = 'opencode half page up' })
      -- vim.keymap.set('n', '<S-C-d>', function()
      --   require('opencode').command 'session.half.page.down'
      -- end, { desc = 'opencode half page down' })
      --
      -- -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
      -- vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment', noremap = true })
      -- vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement', noremap = true })
    end,
  },
}
