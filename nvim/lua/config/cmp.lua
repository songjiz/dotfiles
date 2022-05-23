local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua'},
    { name = 'path' },
    { name = 'buffer', keyword_length = 3 },
    { name = 'omni'}
  },
  snippet = {
    expand = function(args)
      local _, luasnip = pcall(require, 'luasnip')
      if luasnip then
        luasnip.lsp_expand(args.body)
      end
    end
  },
  completion = {
    keyword_length = 1,
    completeopt = 'menu,noselect'
  },
  view = {
    entries = 'custom',
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        path = "[Path]",
        buffer = "[Buffer]",
        omni = "[Omni]",
      }),
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>']  = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Esc>'] = cmp.mapping.close(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<Tab>'] = cmp.mapping(function(fallback)
      local _, luasnip = pcall(require, 'luasnip')
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip and luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      local _, luasnip = pcall(require, 'luasnip')
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip and luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' })
  }),
})
