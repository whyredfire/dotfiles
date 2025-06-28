return {
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require('onedark').setup {
				style = 'dark'
			}
			-- Enable theme
			require('onedark').load()
		end
	}
}
