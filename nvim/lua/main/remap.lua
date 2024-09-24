vim.g.mapleader = " "

vim.keymap.set('n', '<M-h>', '<C-w>h')
vim.keymap.set('n', '<M-l>', '<C-w>l')
vim.keymap.set('n', '<M-j>', '<C-w>j')
vim.keymap.set('n', '<M-k>', '<C-w>k')

vim.keymap.set('n', '<C-S-v>', ':vsplit<CR>')
vim.keymap.set('n', '<C-S-h>', ':split<CR>')

vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>wq', ':wq<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')

vim.keymap.set('n', '<C-h>', '<cmd><C-U>TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<C-j>', '<cmd><C-U>TmuxNavigateDown<cr>')
vim.keymap.set('n', '<C-k>', '<cmd><C-U>TmuxNavigateUp<cr>')
vim.keymap.set('n', '<C-l>', '<cmd><C-U>TmuxNavigateRight<cr>')
