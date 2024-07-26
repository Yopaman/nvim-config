return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = true,
  init = function()
    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = '[T]oggle [T]erminal' })
  end,
}
