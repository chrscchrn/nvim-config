return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Git [D]iff view' },
    { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'Git file [H]istory' },
    { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = 'Git repo [H]istory' },
  },
}
