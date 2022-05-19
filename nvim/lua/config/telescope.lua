local telescope = require('telescope')
local actions   = require('telescope.actions')

telescope.setup {
  defaults = {
    file_ignore_patterns = { 'node_modules', '.git', '.idea', '.vscode' },
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      }
    }
  },
  pickers = {
    find_files = { hidden = true },
  }
}
