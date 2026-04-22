return {
  {
    'Juksuu/worktrees.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'folke/snacks.nvim',
    },
    opts = {},
    config = function(_, opts)
      require('worktrees').setup(opts)
    end,
    keys = {
      {
        '<leader>gws',
        function()
          Snacks.picker.worktrees()
        end,
        desc = '[G]it [W]orktrees [S]witch',
      },
      {
        '<leader>gwn',
        function()
          Snacks.picker.worktrees_new()
        end,
        desc = '[G]it [W]orktrees [N]ew',
      },
      {
        '<leader>gwr',
        function()
          Snacks.picker.worktrees_remove()
        end,
        desc = '[G]it [W]orktrees [R]emove',
      },
    },
  },
}
