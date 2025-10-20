return {
    {'catppuccin/nvim', priority = 1000},

    'nvim-treesitter/nvim-treesitter',

    'mbbill/undotree',

    'lewis6991/gitsigns.nvim',

    'neovim/nvim-lspconfig',

    {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp"
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies =  {
                            'hrsh7th/cmp-nvim-lsp',
                            'L3MON4D3/LuaSnip',
                            'saadparwaiz1/cmp_luasnip'
                        },
        opts = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                            expand = function(args)
                                require('luasnip').lsp_expand(args.body)
                            end,
                          },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    }, {
                    { name = 'buffer' },
                })
            })
        end,
    },

    {
        'mason-org/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {
                'clangd',
                'lua_ls',
                'basedpyright',
                'rust_analyzer'
            }
        },
        dependencies = {
            {'mason-org/mason.nvim', opts = {} },
            --'neovim/nvim-lspconfig',
        },
    },

    {
        'nvim-telescope/telescope.nvim',
	    dependencies =  {
                            'nvim-lua/plenary.nvim',
                        }
    },

}
