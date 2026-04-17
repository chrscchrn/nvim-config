require 'config.config'

vim.opt.runtimepath:prepend("/home/chris/.local/share/nvim/site/")

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  require 'cc.autopairs',
  require 'cc.completion',
  require 'cc.format',
  require 'cc.gitsigns',
  require 'cc.lazygit',
  require 'cc.lint',
  require 'cc.lsp',
  require 'cc.lualine',
  require 'cc.noice',
  require 'cc.oil',
  require 'cc.telescope',
  require 'cc.theme',
  require 'cc.todo',
  require 'cc.treesitter',
  require 'cc.trouble',
  require 'cc.whichkey',

}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
