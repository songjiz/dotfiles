local lualine_available, lualine = pcall(require, "lualine")

if not lualine_available then
  return
end

local M = {}

function M.lsp_status()
  local available, lsp = pcall(require, "lsp-status")

  if available then
    return lsp.status()
  end

  return ""
end

function M.lsp_progress()
  local available, lsp = pcall(require, "lsp-status")

  if available then
    return lsp.status_progress()
  end

  return ""
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "\\", right = "/" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "NvimTree" },
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "filename", "diff" },
    lualine_x = { M.lsp_status, M.lsp_progress },
    lualine_y = { "encoding", "filetype" },
    lualine_z = { "progress", "location" }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
})
