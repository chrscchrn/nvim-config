return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    ---@module 'gitsigns'
    ---@type Gitsigns.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      signs = {
        add = { text = '+' }, ---@diagnostic disable-line: missing-fields
        change = { text = '~' }, ---@diagnostic disable-line: missing-fields
        delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
        topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
        changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
      },
      on_attach = function(bufnr)
        local gs = require 'gitsigns'
        local map = function(mode, keys, func, desc)
          vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'Git: ' .. desc })
        end

        map('n', '<leader>hs', gs.stage_hunk, '[S]tage hunk')
        map('n', '<leader>hr', gs.reset_hunk, '[R]eset hunk')
        map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, '[S]tage hunk')
        map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, '[R]eset hunk')
        map('n', '<leader>hS', gs.stage_buffer, '[S]tage buffer')
        map('n', '<leader>hu', gs.undo_stage_hunk, '[U]ndo stage hunk')
        map('n', '<leader>hR', gs.reset_buffer, '[R]eset buffer')
        map('n', '<leader>hp', gs.preview_hunk, '[P]review hunk')
        map('n', '<leader>hb', gs.blame_line, '[B]lame line')
        map('n', '<leader>hd', gs.diffthis, '[D]iff this')
        map('n', ']h', gs.next_hunk, 'Next hunk')
        map('n', '[h', gs.prev_hunk, 'Prev hunk')
      end,
    },
  },
}
