local luasnip_available, luasnip = pcall(require, "luasnip")

if not luasnip_available then
  return
end

luasnip.config.setup({
  history = true,
  updateevents = "TextChanged,TextChangedI",
})
