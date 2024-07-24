return {
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = function()
            return require "plugins.configs.nvimtree"
        end,
        config = function(_, opts)
            require("nvim-tree").setup(opts)
        end,
        keys = {
            {
                "<C-n>",
                "<cmd>:NvimTreeToggle<cr>",
                desc = "Toggle Nvim tree",
                mode = 'n',
            },
        }
    },
}
