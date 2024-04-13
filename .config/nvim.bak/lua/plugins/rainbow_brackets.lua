return {
	"p00f/nvim-ts-rainbow",
	config = function()
		require("nvim-treesitter.configs").setup({
			rainbow = {
				enable = true,
				-- extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = 512, -- Do not enable for files with more than n lines, int
				-- You can also use your own color palette
				colors = {}, -- table of hex strings
				-- termcolors = {} -- table of colour name strings
			},
		})
	end,
}
