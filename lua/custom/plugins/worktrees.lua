local function has_modified_buffers()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buflisted and vim.bo[buf].modified then
      return true
    end
  end
  return false
end

local function session_path(path)
  return vim.fs.joinpath(path, MiniSessions.config.file)
end

return {
  {
    'Juksuu/worktrees.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'folke/snacks.nvim',
    },
    opts = {
      swap_current_buffer = false,
      hooks = {
        on_before_switch = function()
          if has_modified_buffers() then
            vim.notify('Save or discard modified buffers before switching worktrees', vim.log.levels.WARN)
            return false
          end

          MiniSessions.write(MiniSessions.config.file, { force = true, verbose = false })
          vim.v.this_session = ''

          for _, client in ipairs(vim.lsp.get_clients()) do
            client:stop()
          end
          vim.cmd 'silent! %bwipeout'
          return true
        end,
        on_switch = function(_, to)
          local target_session = session_path(to)
          if vim.fn.filereadable(target_session) == 1 then
            MiniSessions.read(MiniSessions.config.file, { force = false, verbose = false })
          else
            MiniSessions.write(MiniSessions.config.file, { force = true, verbose = false })
          end
        end,
        on_before_remove = function(path)
          local removed_session = session_path(path)
          if vim.v.this_session ~= '' and vim.fs.normalize(vim.v.this_session) == vim.fs.normalize(removed_session) then
            vim.v.this_session = ''
          end
          if vim.fn.filereadable(removed_session) == 1 then
            vim.fn.delete(removed_session)
          end
        end,
      },
    },
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
