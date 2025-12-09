return {
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            -- Header
            dashboard.section.header.val = {
                [[                                                    ]],
                [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
                [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
                [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
                [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
                [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
                [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
                [[                                                    ]],
            }

            -- Menu
            dashboard.section.buttons.val = {
                dashboard.button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
                dashboard.button("e", "  New file", "<cmd>ene <BAR> startinsert<cr>"),
                dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<cr>"),
                dashboard.button("g", "  Find text", "<cmd>Telescope live_grep<cr>"),
                dashboard.button("b", "  File browser", "<cmd>Telescope file_browser<cr>"),
                dashboard.button("c", "  Config", "<cmd>e $MYVIMRC<cr>"),
                dashboard.button("m", "  Mason", "<cmd>Mason<cr>"),
                dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<cr>"),
                dashboard.button("q", "  Quit", "<cmd>qa<cr>"),
            }

            -- Footer
            dashboard.section.footer.val = function()
                local stats = require("lazy").stats()
                return {
                    "",
                    "Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins",
                }
            end

            -- Layout
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"
            dashboard.section.footer.opts.hl = "AlphaFooter"

            dashboard.opts.layout = {
                { type = "padding", val = 2 },
                dashboard.section.header,
                { type = "padding", val = 2 },
                dashboard.section.buttons,
                { type = "padding", val = 1 },
                dashboard.section.footer,
            }

            alpha.setup(dashboard.opts)

            -- Disable folding on alpha buffer
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "alpha",
                callback = function()
                    vim.opt_local.foldenable = false
                end,
            })
        end,
    },

    -- Session management
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = function()
            require("persistence").setup()
        end,
        keys = {
            { "<leader>ss", function() require("persistence").load() end, desc = "Restore session" },
            { "<leader>sl", function() require("persistence").load({ last = true }) end, desc = "Restore last session" },
            { "<leader>sd", function() require("persistence").stop() end, desc = "Don't save session" },
        },
    },

    -- Project management
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                detection_methods = { "pattern", "lsp" },
                patterns = { ".git", "Makefile", "package.json", "go.mod", "Cargo.toml" },
            })
            require("telescope").load_extension("projects")
        end,
        keys = {
            { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
        },
    },
}
