return {
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>lt",
				":!zathura <C-R>=expand('%:r')<CR>.pdf &<CR>",
				{ noremap = true, silent = true, desc = "Open PDF with zathura" }
			)

			vim.g.vimtex_view_method = "zathura"
		end,
	},
}
