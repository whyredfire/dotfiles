return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUpdate" },
        build = ":TSUpdate",
        dependencies = {
            "apple/pkl-neovim",
            "windwp/nvim-ts-autotag",
        },
        opts = function()
            return require("plugins.configs.treesitter")
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
