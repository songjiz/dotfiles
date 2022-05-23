local luasnip = require('luasnip')

luasnip.config.setup {
  history = true,
  updateevents = 'TextChanged,TextChangedI',
}

require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_lua').lazy_load()
