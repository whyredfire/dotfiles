return {
	"akinsho/bufferline.nvim",
	requires = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				numbers = "none",
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator_icon = "▎",
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
					if buf.name:match("%.md") then
						return vim.fn.fnamemodify(buf.name, ":t:r")
					end
				end,
				max_name_length = 18,
				max_prefix_length = 15, -- prefix used when a buffer is deduplicated
				tab_size = 18,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				offsets = { { filetype = "NvimTree", text = "", text_align = "left" } },
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				-- separator_style = "slant",
				enforce_regular_tabs = true,
				always_show_bufferline = false,
				sort_by = "id",
			},
		})
	end,
}
