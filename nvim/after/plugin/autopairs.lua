local autopairs_available, autopairs = pcall(require, "nvim-autopairs")

if not autopairs_available then
  return
end

autopairs.setup({
  check_ts = true, -- enable treesitter
  ts_config = {
    lua = { "string" }, -- don't add pairs in lua string treesitter nodes
    javascript = { "template_string" }, -- don't add pairs in javascript template_string treesitter nodes
  },
})

local cmp_autopairs_available, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

if not cmp_autopairs_available then
  return
end

local cmp_available, cmp = pcall(require, "cmp")

if not cmp_available then
  return
end

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
