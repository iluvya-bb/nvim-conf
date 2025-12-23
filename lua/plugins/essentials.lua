return {
	-- File explorer (nvim-tree)
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>-", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
			{ "<leader>o", "<cmd>NvimTreeFocus<cr>", desc = "Focus file explorer" },
		},
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 35,
					side = "left",
				},
				renderer = {
					group_empty = true,
					icons = {
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
						},
					},
				},
				filters = {
					dotfiles = false,
				},
				git = {
					enable = true,
					ignore = false,
				},
				actions = {
					open_file = {
						quit_on_open = false,
					},
				},
			})
		end,
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		event = "VimEnter",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			-- Show line numbers in Telescope results
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "TelescopeResults",
				callback = function(ctx)
					vim.api.nvim_buf_set_option(ctx.buf, "number", true)
				end,
			})

			-- Function to jump to nth entry and open it
			local function goto_nth(n)
				return function(prompt_bufnr)
					local picker = action_state.get_current_picker(prompt_bufnr)
					picker:set_selection(n - 1)
					actions.select_default(prompt_bufnr)
				end
			end

			-- Generate number mappings for 1-9
			local number_mappings = {}
			for i = 1, 9 do
				number_mappings[tostring(i)] = goto_nth(i)
			end

			telescope.setup({
				defaults = {
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
					},
					file_ignore_patterns = { "node_modules/", "dist/", "target/" },
					mappings = {
						n = number_mappings,
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
					live_grep = {
						additional_args = function()
							return { "--glob", "!node_modules/**" }
						end,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			-- Load fzf extension
			telescope.load_extension("fzf")
		end,
	},

	-- Bufferline (tabs at top)
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
					offsets = {
						{ filetype = "NvimTree", text = "File Explorer", highlight = "Directory" },
					},
				},
			})
		end,
		keys = {
			{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
			{ "<leader>x", "<cmd>bdelete<cr>", desc = "Close buffer" },
		},
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
				},
			})
		end,
	},

	-- Git signs
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
		end,
	},

	-- Autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Comment toggling
	{
		"numToStr/Comment.nvim",
		keys = {
			{ "gcc", mode = "n", desc = "Comment line" },
			{ "gc", mode = "v", desc = "Comment selection" },
		},
		config = true,
	},

	-- Which-key for keybinding hints
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup({})
		end,
	},

	-- LSP peek/preview
	{
		"dnlhc/glance.nvim",
		cmd = "Glance",
		config = function()
			require("glance").setup({})
		end,
	},

	-- Leap (quick jump motion)
	{
		"ggandor/leap.nvim",
		keys = {
			{ "s", "<Plug>(leap-forward)", mode = { "n", "x", "o" }, desc = "Leap forward" },
			{ "S", "<Plug>(leap-backward)", mode = { "n", "x", "o" }, desc = "Leap backward" },
			{ "gs", "<Plug>(leap-from-window)", mode = { "n", "x", "o" }, desc = "Leap from window" },
		},
		config = function()
			require("leap").setup({})
		end,
	},
}
