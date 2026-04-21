return {
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function()
            require('onedark').setup {
                style = 'dark',
                transparent = true,
                highlights = {
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    SignColumn = { bg = "none" },
                    EndOfBuffer = { bg = "none" },
                },
            }
            -- Enable theme
            require('onedark').load()
        end
    }
}
