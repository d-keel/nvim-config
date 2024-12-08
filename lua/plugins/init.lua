return {
    {'catppuccin/nvim', priority = 1000},

    'nvim-treesitter/nvim-treesitter',

    'mbbill/undotree',

    'lewis6991/gitsigns.nvim',

    'neovim/nvim-lspconfig',

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
      'williamboman/mason.nvim',
      opts = function()
          require('mason').setup({
              ensure_installed = {
                  'clangd',
                  'lua',
                  'basedpyright',
                  'rust_analyzer'
              }

          })
      end,
    },

    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {'mason.nvim'},
        opts = function()
            require('mason-lspconfig').setup()
            require('mason-lspconfig').setup_handlers({
                function(server_name)
                    require('lspconfig')[server_name].setup({
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),
                    })
                end,
            })
        end,
        },

    {
        'nvim-telescope/telescope.nvim',
	    dependencies =  { 
                            'nvim-lua/plenary.nvim',
                        }
    },

    {
        'Julian/lean.nvim',
        dependencies =  {
                            'neovim/nvim-lspconfig',
                            'nvim-lua/plenary.nvim',
                            'nvim-cmp'
                        },
        opts =  {
                    mappings = true,
                }
    }

}
