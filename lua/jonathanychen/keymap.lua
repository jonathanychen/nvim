vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
vim.keymap.set('n', 'gr?', vim.diagnostic.open_float)

local telescope_builtin = require('telescope.builtin')

vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>", { desc = 'Telescope browse files' })
vim.keymap.set("n", "<space>ff", telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set("n", "<space>fg", telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set("n", "<space>fh", telescope_builtin.help_tags, { desc = 'Telescope help tags' })

-- Move within visual lines
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
