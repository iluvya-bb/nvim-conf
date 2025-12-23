return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",
                    "gopls",
                    "ts_ls",
                    "clangd",
                    "rust_analyzer",
                    "lua_ls",
                    "taplo",
                },
                automatic_enable = false, -- We'll enable manually
            })
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "LspAttach",
        opts = {
            bind = true,
            handler_opts = { border = "rounded" },
            hint_enable = true,
            hint_prefix = "󰏫 ",
            floating_window = true,
            floating_window_above_cur_line = true,
            toggle_key = "<C-k>",
            select_signature_key = "<C-n>",
        },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        lazy = true,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Diagnostic signs (Neovim 0.11+ way)
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.HINT] = "󰌵",
                        [vim.diagnostic.severity.INFO] = "",
                    },
                },
                virtual_text = {
                    prefix = "●",
                    spacing = 2,
                },
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = true,
                },
            })

            -- Python
            vim.lsp.config.pyright = {
                cmd = { "pyright-langserver", "--stdio" },
                filetypes = { "python" },
                root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            }

            -- Go
            vim.lsp.config.gopls = {
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_markers = { "go.mod", "go.work", ".git" },
                capabilities = capabilities,
                settings = {
                    gopls = {
                        analyses = { unusedparams = true },
                        staticcheck = true,
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                    },
                },
            }

            -- TypeScript/JavaScript
            vim.lsp.config.ts_ls = {
                cmd = { "typescript-language-server", "--stdio" },
                filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
                root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
                capabilities = capabilities,
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    },
                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    },
                },
            }

            -- C/C++
            vim.lsp.config.clangd = {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                },
                filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
                root_markers = { "compile_commands.json", "compile_flags.txt", ".clangd", ".git" },
                capabilities = capabilities,
            }

            -- Lua
            vim.lsp.config.lua_ls = {
                cmd = { "lua-language-server" },
                filetypes = { "lua" },
                root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = { checkThirdParty = false },
                        completion = { callSnippet = "Replace" },
                        telemetry = { enable = false },
                        hint = { enable = true },
                        diagnostics = { globals = { "vim" } },
                    },
                },
            }

            -- TOML
            vim.lsp.config.taplo = {
                cmd = { "taplo", "lsp", "stdio" },
                filetypes = { "toml" },
                root_markers = { ".git" },
                capabilities = capabilities,
            }

            -- Rust
            vim.lsp.config.rust_analyzer = {
                cmd = { "rust-analyzer" },
                filetypes = { "rust" },
                root_markers = { "Cargo.toml", "rust-project.json" },
                single_file_support = true,
                capabilities = capabilities,
                root_dir = function(bufnr, on_dir)
                    local fname = vim.api.nvim_buf_get_name(bufnr)
                    -- Try to find Cargo.toml
                    local cargo_root = vim.fs.root(bufnr, { "Cargo.toml", "rust-project.json" })
                    if cargo_root then
                        on_dir(cargo_root)
                    else
                        -- Fallback to file's directory for standalone files
                        on_dir(vim.fn.fnamemodify(fname, ":p:h"))
                    end
                end,
                settings = {
                    ["rust-analyzer"] = {
                        check = {
                            command = "check",  -- faster than clippy
                        },
                        cargo = {
                            allFeatures = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                        -- Allow standalone files
                        workspace = {
                            discoverConfig = nil,
                        },
                        inlayHints = {
                            typeHints = { enable = true },
                            parameterHints = { enable = true },
                            chainingHints = { enable = true },
                            closingBraceHints = { enable = true, minLines = 20 },
                        },
                        completion = {
                            fullFunctionSignatures = { enable = true },
                            postfix = { enable = true },
                        },
                        diagnostics = {
                            enable = true,
                        },
                    },
                },
            }

            -- Handle diagnostic refresh requests from rust-analyzer
            vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
                local clients = vim.lsp.get_clients({ id = ctx.client_id })
                for _, client in ipairs(clients) do
                    for bufnr in pairs(client.attached_buffers) do
                        vim.diagnostic.reset(vim.lsp.diagnostic.get_namespace(client.id), bufnr)
                    end
                end
                return vim.NIL
            end

            -- Enable all configured servers
            vim.lsp.enable({
                "pyright",
                "gopls",
                "ts_ls",
                "clangd",
                "lua_ls",
                "taplo",
                "rust_analyzer",
            })

            -- LSP keymaps on attach
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
                    end

                    -- Enable inlay hints if supported
                    if client and client.supports_method("textDocument/inlayHint") then
                        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    end

                    map("gd", vim.lsp.buf.definition, "Go to definition")
                    map("gD", vim.lsp.buf.declaration, "Go to declaration")
                    map("gr", vim.lsp.buf.references, "Go to references")
                    map("gi", vim.lsp.buf.implementation, "Go to implementation")
                    map("K", vim.lsp.buf.hover, "Hover documentation")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
                    map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
                    map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
                    map("]d", vim.diagnostic.goto_next, "Next diagnostic")
                    map("gl", vim.diagnostic.open_float, "Show diagnostic")
                    map("<leader>q", vim.diagnostic.setloclist, "Diagnostics to loclist")
                    map("<leader>lr", "<cmd>LspRestart<cr>", "Restart LSP")
                end,
            })
        end,
    },
}
