return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"python",
					"go",
					"gomod",
					"gosum",
					"typescript",
					"javascript",
					"tsx",
					"c",
					"cpp",
					"lua",
					"vim",
					"vimdoc",
					"json",
					"yaml",
					"toml",
					"markdown",
					"markdown_inline",
					"bash",
					"rust",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
