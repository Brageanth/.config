-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.spell = true
vim.opt.spelllang = { "en_us" }
vim.g.autoformat = false
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function ()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent =  true
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en,en"
    vim.opt_local.conceallevel = 2
    vim.opt_local.textwidth = 0
    vim.opt_local.shiftwidth = 2
  end
})
