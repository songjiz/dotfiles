local toggleterm_available, toggleterm = pcall(require, "toggleterm")

if not toggleterm_available then
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

