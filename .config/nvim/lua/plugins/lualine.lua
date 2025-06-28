return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event = "VeryLazy",
        opts = {
            options = {
                icons_enabled = true,
                theme = 'auto',
                disabled_filetypes = { 'NvimTree' },
                ignore_focus = { 'NvimTree' },
                globalstatus = true,
            }
        },
    },
}
