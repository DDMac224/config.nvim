return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
    },
    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("mason").setup({})

        require("mason-lspconfig").setup({
            ensure_installed = {
                "asmfmt",
                "asm-lsp",
                "black",
                "clangd",
                "clang-format",
                "google-java-format",
                "lua_ls",
                "mypy",
                "prettier",
                "pyright",
                "rust_analyzer",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                lua_ls = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                workspace = {
                                    library = {
                                        vim.env.VIMRUNTIME,
                                    },
                                },
                            },
                        },
                    })
                end,
                pyright = function()
                    require("lspconfig").pyright.setup({
                        capabilities = capabilities,
                        root_dir = require("lspconfig").util.root_pattern(".venv", "venv", ".git"),
                        filetypes = { "python" },
                    })
                end,
                rust_analyzer = function()
                    require("lspconfig").rust_analyzer.setup({
                        capabilities = capabilities,
                        filetypes = { "rust" },
                        root_dir = require("lspconfig").util.root_pattern("Cargo.toml"),
                        settings = {
                            ["rust_analyzer"] = {
                                cargo = {
                                    allFeatures = true,
                                },
                            },
                        },
                    })
                end,
                gopls = function()
                    require("lspconfig").gopls.setup({
                        capabilities = capabilities,
                        cmd = { "gopls" },
                        filetypes = { "go", "gomod", "gowork", "gotmpl" },
                        root_dir = require("lspconfig").util.root_pattern("go.work", "go.mod", ".git"),
                        settings = {
                            gopls = {
                                completeUnimported = true,
                                usePlaceholders = true,
                                analyses = {
                                    unusedparams = true,
                                },
                            },
                        },
                    })
                end,
                clangd = function()
                    require("lspconfig").clangd.setup({
                        capabilities = capabilities,
                        cmd = { "/usr/bin/clangd" },
                        filetypes = { "c", "cpp" },
                        root_dir = require("lspconfig").util.root_pattern(
                            ".clangd",
                            ".clang-tidy",
                            ".clang-format",
                            "compile_commands.json",
                            "compile_flags.txt",
                            "configure.ac",
                            ".git"
                        ),
                        single_file_support = true,
                    })
                end,
                asm_lsp = function()
                    require("lspconfig").asm_lsp.setup({
                        capabilities = capabilities,
                        cmd = { "asm-lsp" },
                        filetypes = { "asm", "s", "S" },
                        root_dir = require("lspconfig").util.root_pattern(".asm-lsp.toml", ".git"),
                    })
                end,
            },
        })

        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            sources = {
                { name = "path" },
                { name = "nvim_lsp" },
                { name = "luasnip", keyword_length = 2 },
                { name = "buffer",  keyword_length = 3 },
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                -- ['<C-Space>'] = cmp.mapping.complete(),
            }),
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
        })
    end,
}
