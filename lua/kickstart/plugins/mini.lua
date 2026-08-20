return {
  {
    'nvim-mini/mini.nvim',
    config = function()
      -- Avoid Neovim's built-in incremental-selection mappings on `an` and `in`.
      require('mini.ai').setup {
        mappings = {
          around_next = 'aa',
          inside_next = 'ii',
        },
        n_lines = 500,
      }

      require('mini.surround').setup()

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      require('mini.sessions').setup()
    end,
  },
}
