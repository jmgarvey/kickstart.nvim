return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    local wk = require 'which-key'
    harpoon:setup()

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon [A]dd to list' })

    vim.keymap.set('n', '<leader>hq', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[H]arpoon [Q]uick Menu' })

    for _, idx in ipairs { 1, 2, 3, 4, 5 } do
      vim.keymap.set('n', string.format('<space>%d', idx), function()
        harpoon:list():select(idx)
      end, { desc = string.format('Harpoon [%d]', idx) })
      wk.add { string.format('<space>%d', idx), hidden = true } -- do not show in which-key menu
    end
  end,
}
