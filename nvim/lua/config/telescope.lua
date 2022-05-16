local telescope = require('telescope')
local actions   = require('telescope.actions')

telescope.setup {
  defaults = {
    file_ignore_patterns = { 'node_modules', '.git', '.idea', '.vscode' },
  },
  pickers = {
    find_files = { hidden = true },
  }
}
