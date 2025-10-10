vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.swapfile = false

vim.opt.clipboard = "unnamedplus"

local two_space_filetypes = { "html", "javascriptreact", "typescriptreact", "cpp", "java", "haskell" }
local eight_space_filetypes = { "c" }

local function set_tabstop(filetypes, size)
    for _, ft in ipairs(filetypes) do
        vim.api.nvim_create_autocmd("FileType", {
            pattern = ft,
            callback = function()
                vim.opt_local.shiftwidth = size
                vim.opt_local.tabstop = size
                vim.opt_local.softtabstop = size
            end
        })
    end
end

set_tabstop(two_space_filetypes, 2)
set_tabstop(eight_space_filetypes, 8)
