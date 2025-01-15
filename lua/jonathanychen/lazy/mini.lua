return {
    {
        'echasnovski/mini.statusline',
        version = false,
        config = function()
            require('mini.statusline').setup()
        end
    },
    {
        'echasnovski/mini.surround',
        version = false,
        config = function()
            require('mini.surround').setup()
        end
    }
}
