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
    branch = 'master',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      enable = true,
      multiwindow = false,
      max_lines = 4,
      min_window_height = 15,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = 'outer',
      mode = 'topline',
      separator = '─',
      zindex = 20,
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
