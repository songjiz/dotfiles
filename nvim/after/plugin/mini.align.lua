local mini_align_available, mini_align = pcall(require, "mini.align")

if not mini_align_available then
  return
end

mini_align.setup({
  mappings = {
    start = "ga",
    start_with_preview = "gA"
  }
})
