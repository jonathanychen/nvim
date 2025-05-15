vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)


local telescope_builtin = require('telescope.builtin')

vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>", { desc = 'Telescope browse files' })
vim.keymap.set("n", "<space>ff", telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set("n", "<space>fg", telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set("n", "<space>fh", telescope_builtin.help_tags, { desc = 'Telescope help tags' })
