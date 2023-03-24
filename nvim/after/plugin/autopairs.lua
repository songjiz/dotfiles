local ok, autopairs = pcall(require, "nvim-autopairs")

if not ok then
  return
end

autopairs.setup({
  check_ts = true, -- enable treesitter
  ts_config = {
    lua = { "string" }, -- don't add pairs in lua string treesitter nodes
    javascript = { "template_string" }, -- don't add pairs in javascript template_string treesitter nodes
  },
})

local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

if not ok then
  return
end

local ok, cmp = pcall(require, "cmp")

if not ok then
  return
end

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
