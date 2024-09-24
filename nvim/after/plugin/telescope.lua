local builtin = require('telescope.builtin')
local previous_search = nil

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
  local search = vim.fn.input("Grep > ")
  if search ~= "" then
  	builtin.grep_string({ search = search })
	  previous_search = search
  else
  	builtin.grep_string({ search = previous_search})
  end
end)
vim.keymap.set('v', '<leader>s', function()
  vim.cmd.normal{'"zy', bang = true}
  local selection = vim.fn.getreg("z")

  builtin.grep_string({ search = selection })
	previous_search = selection 
end)

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
