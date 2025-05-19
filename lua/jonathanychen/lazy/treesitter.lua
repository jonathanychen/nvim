return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    "javascript", "typescript", "lua", "go", "python",
                },

                sync_install = false,

                indent = {
                    enable = true,
                },

                highlight = {
                    enable = true,
                },
            })

            require('nvim-treesitter.parsers')
        end
    }
}
