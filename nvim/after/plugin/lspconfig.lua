-- 﫠             

-- diagnostaic
local signs = { Ok = "﫠", Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focus = true,
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

local lspconfig_available, lspconfig = pcall(require, "lspconfig")

if not lspconfig_available then
  return
end

local cmp_nvim_lsp_available, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not cmp_nvim_lsp_available then
  return
end

local lsp_status_available, lsp_status = pcall(require, "lsp-status")

if not lsp_status_available then
  return
end

lsp_status.config({
  kind_labels = {},
  show_filename = true,
  current_function = false,
  diagnostics = true,
  indicator_separator = " ",
  component_separator = " ",
  indicator_errors = signs.Error,
  indicator_warnings = signs.Warn,
  indicator_info = signs.Info,
  indicator_hint = signs.Hint,
  indicator_ok = signs.Ok,
  spinner_frames = { "⠴", "⠤", "⠦", "⠇" },
  -- spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
  status_symbol = " ",
  select_symbol = nil,
  update_interval = 100
})

lsp_status.register_progress()

local keymap = vim.keymap

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  lsp_status.on_attach(client)

  -- keybind options
  -- local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  -- keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  -- keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  -- keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables
  end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities = vim.tbl_extend("keep", capabilities or {}, lsp_status.capabilities)

local popup_opts = { border = "rounded", max_width = 80 }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, popup_opts)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, popup_opts)

lspconfig.solargraph.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.rust_analyzer.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.tsserver.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.tailwindcss.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.emmet_ls.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim"},
      },
      workspace = {
        checkThirdParty = false,
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
