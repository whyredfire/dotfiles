return {
    {
        "nvim-tree/nvim-tree.lua",
        commit = "85d1145ac71c1b8e1423862c78165a1f609faf60",
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
