vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascriptreact",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typescriptreact",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end
})
