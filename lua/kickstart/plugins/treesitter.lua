return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    opts = {},
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    branch = 'master', -- this plugin uses 'master' branch no port to main branch yet
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      multiwindow = false, -- Disable multiwindow support for better performance
      max_lines = 4, -- Show up to 4 lines of context (optimal balance)
      min_window_height = 15, -- Only show context when window is at least 15 lines tall
      line_numbers = true, -- Show line numbers in context (helpful for navigation)
      multiline_threshold = 20, -- Show context for scopes with 20+ lines (more selective)
      trim_scope = 'outer', -- Discard outer context lines when max_lines exceeded
      mode = 'topline', -- Calculate context from top visible line (better for search)
      -- Visual separator makes context boundary clear
      separator = '─', -- Unicode horizontal line separator
      zindex = 20, -- Keep context above other floating windows
      on_attach = function(buf)
        -- Disable in very large files for performance
        local max_filesize = 200 * 1024 -- 200 KB
        local filename = vim.api.nvim_buf_get_name(buf)
        if filename == '' then
          return true
        end
        local ok, stats = pcall(vim.uv.fs_stat, filename)
        return not (ok and stats and stats.size > max_filesize)
      end,
    },
  },
  {
    'MeanderingProgrammer/treesitter-modules.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      ensure_installed = {
        'c',
        'bash',
        'diff',
        'html',
        'lua',
        'luadoc',
        'vim',
        'vimdoc',
        'query',
        'markdown',
        'markdown_inline',
        'go',
        'gomod',
        'gosum',
        'jsdoc',
        'javascript',
        'typescript',
        'tsx',
        'regex',
      },
      auto_install = true,

      highlight = {
        enable = true,

        disable = function(lang, buf)
          -- buf may be nil or invalid in some contexts on the main branch
          if not buf or type(buf) ~= 'number' then
            return false
          end
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,

        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<leader>is',
          node_incremental = '<leader>ii',
          scope_incremental = '<leader>ic',
          node_decremental = '<leader>id',
        },
      },
    },
  },
}
