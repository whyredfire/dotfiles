return {
	"zeioth/garbage-day.nvim",
	dependencies = "neovim/nvim-lspconfig",
	event = "VeryLazy",
	opts = {
		excluded_lsp_clients = {
			"copilot",
			"null-ls",
			"jdtls",
			"marksman",
			"lua_ls",
		},
		notifications = true,
		grace_period = 60 * 5, -- in seconds
		wakeup_delay = 1750, -- in milliseconds
		retries = 6,
		timeout = 1000 * 60, -- in milliseconds
	},
}
