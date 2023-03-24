local ok, luasnip = pcall(require, "luasnip")

if not ok then
  return
end

luasnip.config.setup({
  history = true,
  updateevents = "TextChanged,TextChangedI",
})
