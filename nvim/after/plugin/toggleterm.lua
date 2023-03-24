local ok, toggleterm = pcall(require, "toggleterm")

if not ok then
  return
end

toggleterm.setup({
  open_mapping = [[<C-\>]],
  direction = "float",
  float_opts = {
    border = "single",
    winblend = 3,
  }
})

