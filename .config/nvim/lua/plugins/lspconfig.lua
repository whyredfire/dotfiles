return {
	"neovim/nvim-lspconfig",
	-- enabled = false,
	event = { "BufReadPre", "BufNewFile", "InsertEnter" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	dependencies = {
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local function border(hl_name)
			return {
				{ "╭", hl_name },
				{ "─", hl_name },
				{ "╮", hl_name },
				{ "│", hl_name },
				{ "╯", hl_name },
				{ "─", hl_name },
				{ "╰", hl_name },
				{ "│", hl_name },
			}
		end

		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

		-- TODO: the background doesn't become transparent
		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = border("CmpPMenu"),
				winhighlight = "Normal:CmpPMenu,FloatBorder:CmpPMenuBorder",
			}),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = border("CmpPMenu"),
				winhighlight = "Normal:CmpPMenu,FloatBorder:CmpPMenuBorder",
			}),
		}

		local servers = {
			lua_ls = {
				single_file_support = true,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
						telemetry = {
							enable = false,
						},
						hint = {
							enable = true,
						},
					},
				},
			},
			html = {
				-- cmd = { "vscode-html-language-server", "--stdio" },
				filetypes = { "html" },
				root_dir = lspconfig.util.root_pattern(".git", "package.json"),
			},
            -- htmx = {},
			ruff_lsp = {},
			pyright = {},
			-- basedpyright = {},
			cssls = {},
			ts_ls = {
				enabled = true,
				single_file_support = true,
				root_dir = lspconfig.util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
				settings = {
					javascript = {
						inlayHints = {
							includeInlayEnumMemberValueHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayVariableTypeHints = false,
						},
					},

					typescript = {
						inlayHints = {
							includeInlayEnumMemberValueHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all';
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayVariableTypeHints = true,
						},
					},
				},
			},
			tailwindcss = {
				single_file_support = false,
				-- cmd = { "tailwindcss-language-server", "--stdio" },
				filetypes = {
					"html",
					"htmldjango",
					"css",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
				},
				root_dir = lspconfig.util.root_pattern(
					"tailwind.config.js",
					"tailwind.config.cjs",
					"tailwind.config.ts",
					"pyproject.toml",
					"package.json",
					".git"
				),
			},
			marksman = {},
		}

		-- provides "capabalities" and "on_attach" to all servers
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local server_opts = servers[server_name] or {}
				-- server_opts["handlers"] = handlers
				-- server_opts["autostart"] = false
				server_opts["on_attach"] = on_attach
				server_opts["capabilities"] = capabilities
				lspconfig[server_name].setup(server_opts)
			end,
		})
	end,
}
