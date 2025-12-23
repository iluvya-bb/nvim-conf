return {
    -- Formatter
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            { "<leader>cf", function() require("conform").format({ async = true }) end, desc = "Format buffer" },
        },
        opts = {
            formatters_by_ft = {
                python = { "black", "isort" },
                go = { "gofmt", "goimports" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                lua = { "stylua" },
                rust = { "rustfmt" },
                toml = { "taplo" },
            },
            formatters = {
                prettier = {
                    prepend_args = { "--use-tabs", "--tab-width", "4" },
                },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
                quiet = true,  -- Don't show error when formatter fails
            },
        },
    },

    -- Surround
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true,
    },

    -- Indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            indent = { char = "│" },
            scope = { enabled = true },
        },
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        keys = {
            { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
            { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float terminal" },
            { "<leader>th", "<cmd>ToggleTerm direction=horizontal size=15<cr>", desc = "Horizontal terminal" },
            { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Vertical terminal" },
        },
        opts = {
            open_mapping = [[<C-\>]],
            direction = "float",
            float_opts = {
                border = "curved",
            },
        },
    },

    -- Diagnostics list
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
            { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
            { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
            { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
        },
        opts = {},
    },

    -- Lazygit
    {
        "kdheepak/lazygit.nvim",
        cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },

    -- Todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = { "BufReadPost", "BufNewFile" },
        keys = {
            { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo list" },
            { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
            { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo" },
            { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo" },
        },
        opts = {},
    },

    -- Undotree
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo tree" },
        },
    },

    -- Colorizer
    {
        "norcalli/nvim-colorizer.lua",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("colorizer").setup({
                "*",
                css = { css = true },
                html = { names = true },
            }, {
                RGB = true,
                RRGGBB = true,
                names = false,
                RRGGBBAA = true,
                rgb_fn = true,
                hsl_fn = true,
                mode = "background",
            })
        end,
    },

    -- Auto-close/rename HTML/JSX tags
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },

    -- Debugger
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
        },
        keys = {
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
            { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
            { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
            { "<leader>do", function() require("dap").step_over() end, desc = "Step over" },
            { "<leader>dO", function() require("dap").step_out() end, desc = "Step out" },
            { "<leader>dr", function() require("dap").repl.open() end, desc = "Open REPL" },
            { "<leader>dl", function() require("dap").run_last() end, desc = "Run last" },
            { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
            { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()
            require("nvim-dap-virtual-text").setup()

            -- Auto open/close DAP UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- Node.js / TypeScript
            dap.adapters.node2 = {
                type = "executable",
                command = "node",
                args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
            }
            dap.configurations.javascript = {
                {
                    type = "node2",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = vim.fn.getcwd(),
                    sourceMaps = true,
                    protocol = "inspector",
                },
            }
            dap.configurations.typescript = dap.configurations.javascript

            -- Python
            dap.adapters.python = {
                type = "executable",
                command = "python",
                args = { "-m", "debugpy.adapter" },
            }
            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = function()
                        return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
                    end,
                },
            }

            -- Go
            dap.adapters.delve = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "dlv",
                    args = { "dap", "-l", "127.0.0.1:${port}" },
                },
            }
            dap.configurations.go = {
                {
                    type = "delve",
                    name = "Debug",
                    request = "launch",
                    program = "${file}",
                },
            }
        end,
    },

    -- Project search/replace
    {
        "nvim-pack/nvim-spectre",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>sr", function() require("spectre").open() end, desc = "Search and replace" },
            { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end, desc = "Search current word" },
            { "<leader>sp", function() require("spectre").open_file_search({ select_word = true }) end, desc = "Search in file" },
        },
        opts = {},
    },

    -- Session management
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        keys = {
            { "<leader>qs", function() require("persistence").load() end, desc = "Restore session" },
            { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore last session" },
            { "<leader>qd", function() require("persistence").stop() end, desc = "Don't save session" },
        },
        opts = {},
    },

    -- Auto-save
    {
        "okuuva/auto-save.nvim",
        event = { "InsertLeave", "TextChanged" },
        opts = {
            trigger_events = {
                immediate_save = { "BufLeave", "FocusLost" },
                defer_save = { "InsertLeave", "TextChanged" },
            },
            debounce_delay = 1000,
        },
        config = function(_, opts)
            require("auto-save").setup(opts)
            vim.api.nvim_create_autocmd("User", {
                pattern = "AutoSaveWritePost",
                callback = function(args)
                    if args.data.saved_buffer then
                        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(args.data.saved_buffer), ":t")
                        vim.notify("Saved " .. filename, vim.log.levels.INFO)
                    end
                end,
            })
        end,
    },

    -- Symbols outline
    {
        "hedyhli/outline.nvim",
        cmd = { "Outline", "OutlineOpen" },
        keys = {
            { "<leader>cs", "<cmd>Outline<cr>", desc = "Toggle symbols outline" },
        },
        opts = {
            outline_window = {
                position = "right",
                width = 30,
            },
            symbols = {
                filter = {
                    default = { "String", exclude = true },
                    python = { "Function", "Class", "Method" },
                    go = { "Function", "Struct", "Interface", "Method" },
                    rust = { "Function", "Struct", "Enum", "Impl", "Trait", "Method" },
                },
            },
            symbol_folding = {
                autofold_depth = 1,
            },
        },
    },

    -- Better folds
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        event = "BufReadPost",
        keys = {
            { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
            { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
            { "zK", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek fold" },
        },
        init = function()
            vim.o.foldcolumn = "1"
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
        end,
        opts = {
            provider_selector = function()
                return { "treesitter", "indent" }
            end,
        },
    },
}
