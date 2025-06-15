vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.swapfile = false

vim.opt.clipboard = "unnamedplus"

local frontend_filetypes = { "html", "javascriptreact", "typescriptreact", "cpp" }

for _, ft in ipairs(frontend_filetypes) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = ft,
        callback = function()
            vim.opt_local.shiftwidth = 2
            vim.opt_local.tabstop = 2
        end
    })
end
