return {
    'neovim/nvim-lspconfig',
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        requires = {
            'williamboman/mason.nvim',
        },
        opts = {
            servers = {
                lua_ls = {},
                pyright = {},
                ts_ls = {},
                gopls = {},
            }
        },
        config = function(_, opts)
            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'ts_ls',
                    'pyright',
                    'lua_ls',
                    'gopls',
                },
            })

            local lspconfig = require("lspconfig")
            for server, config in pairs(opts.servers) do
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end

            vim.diagnostic.config({
                virtual_text = true
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end
                    if client.supports_method('textDocument/formatting') then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end
                        })
                    end
                end,
            })
        end,
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        requires = {
            'williamboman/mason.nvim',
        },
        config = function()
            require('mason-tool-installer').setup({
                ensure_installed = {
                    'prettierd',
                    'black',
                    'isort',
                },
            })
        end,
    },


    -- "williamboman/mason.nvim",
    -- "williamboman/mason-lspconfig.nvim",
    -- {
    --     "neovim/nvim-lspconfig",
    --     dependencies = {
    --         "williamboman/mason.nvim",
    --         "williamboman/mason-lspconfig",
    --         "saghen/blink.cmp",
    --         {
    --             "folke/lazydev.nvim",
    --             ft = "lua",
    --             opts = {
    --                 library = {
    --                     { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    --                 },
    --             },
    --         },
    --     },
    --     opts = {
    --         servers = {
    --             lua_ls = {},
    --             pyright = {},
    --             gopls = {},
    --         }
    --     },
    --     config = function(_, opts)
    --         require("mason").setup()
    --         require("mason-lspconfig").setup {
    --             ensure_installed = { "lua_ls", "pyright", "gopls", "prettier", "typescript-language-server" },
    --             automatic_installation = true,
    --         }

    --         local lspconfig = require("lspconfig")
    --         for server, config in pairs(opts.servers) do
    --             config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
    --             lspconfig[server].setup(config)
    --         end

    --         vim.diagnostic.config({
    --             virtual_text = true
    --         })

    --         vim.api.nvim_create_autocmd('LspAttach', {
    --             callback = function(args)
    --                 local client = vim.lsp.get_client_by_id(args.data.client_id)
    --                 if not client then return end

    --                 if client.supports_method('textDocument/formatting') then
    --                     vim.api.nvim_create_autocmd('BufWritePre', {
    --                         buffer = args.buf,
    --                         callback = function()
    --                             vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
    --                         end
    --                     })
    --                 end
    --             end,
    --         })
    --     end,
    -- },
}
