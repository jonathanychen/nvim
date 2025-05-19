return {
    {
        'saghen/blink.cmp',
        dependencies = "rafamadriz/friendly-snippets",
        version = "v0.*",
        opts = {
            keymap = { preset = "default" },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono',
            },

            signature = { enabled = true },
        },
    },
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    },
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false
                }
            })
        end
    }
}
