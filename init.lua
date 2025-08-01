require 'config.options'
require 'config.autocmds'
require 'config.keymaps'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
    -- Theme first, always
    { 'f4z3r/gruvbox-material.nvim', name = 'gruvbox-material', lazy = false, priority = 1000, opts = {} },

    require 'cc.plugins.alpha',
    require 'cc.plugins.autopairs',
    require 'cc.plugins.completion', -- switch to rust fzf
    require 'cc.plugins.fileexplorer',
    require 'cc.plugins.format',
    require 'cc.plugins.gitsigns', -- (removed hunk)
    -- require 'cc.plugins.harpoon', -- delete num?
    require 'cc.plugins.lazygit',
    require 'cc.plugins.lint',
    require 'cc.plugins.lsp', -- kepmays
    require 'cc.plugins.lualine',
    require 'cc.plugins.noice',
    require 'cc.plugins.telescope',
    require 'cc.plugins.todo',
    require 'cc.plugins.treesitter',
    require 'cc.plugins.trouble',
    require 'cc.plugins.whichkey',
    require 'cc.plugins.windsurf',
    require 'cc.plugins.zenmode',

    -- custom
    -- require 'cc.plugins.dictionary',
    -- require 'cc.plugins.lexical',
}, {

    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
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

-- require 'cc.custom.python-lsp-chris'
-- require 'cc.custom.mdlsp'
-- require 'cc.custom.dictionary'
-- require 'cc.custom.lexical'

-- vim: ts=2 sts=2 sw=2 et
