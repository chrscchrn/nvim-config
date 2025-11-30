return {

    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('catppuccin').setup {
                flavour = 'mocha',

                color_overrides = {
                    all = {
                        base = '#282c35',
                        mantle = '#282c35',
                        crust = '#282c35',
                        red = '#c68f92',
                        green = '#a9cfa4',
                        yellow = '#d4c1a5',
                        blue = '#8daecf',
                        magenta = '#c6979c',
                        cyan = '#86b8b8',
                        subtext1 = '#cccccc',
                        subtext0 = '#a0a0a0',
                        overlay2 = '#d4d4d4',
                        overlay1 = '#d4d4d4',
                        overlay0 = '#d4d4d4',
                        surface2 = '#7f7f7f',
                        surface1 = '#7f7f7f',
                        surface0 = '#7f7f7f',
                    },
                },

                custom_highlights = function(colors)
                    return {
                        Normal = { bg = colors.base, fg = '#cccccc' },
                        Visual = { bg = '#484e5b', fg = '#ffffff' },
                        Cursor = { fg = '#ffffff', bg = '#c7c7c7' },
                        Comment = { fg = '#969696' },
                    }
                end,
            }

            vim.opt.termguicolors = true

            vim.cmd.colorscheme 'catppuccin'
        end,
    },
    {
        'tribela/transparent.nvim',
        event = 'VimEnter',
    },
}
