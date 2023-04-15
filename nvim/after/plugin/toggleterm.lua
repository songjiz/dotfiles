local toggleterm_available, toggleterm = pcall(require, "toggleterm")

if not toggleterm_available then
  return
end

local Terminal = require("toggleterm.terminal").Terminal

local opts = {
  direction = "float",
  float_opts = {
    border = "rounded",
    winblend = 0,
  },
  highlights = {
    NormalFloat = {
      link = "Normal",
    },
    FloatBorder = {
      link = "FloatBorder"
    }
  }
}

local irb = Terminal:new(
  vim.tbl_deep_extend(
    "force",
    { cmd = "irb --noautocomplete" },
    opts
  )
)

function toggle_irb()
  irb:toggle()
end

vim.api.nvim_create_user_command("IRB", "lua toggle_irb()", { bang = true })

local rails_console = Terminal:new(
  vim.tbl_deep_extend(
    "force",
    { cmd = "bundle exec rails console" },
    opts
  )
)

function toggle_rails_console()
  rails_console:toggle()
end

vim.api.nvim_create_user_command("RailsConsole", "lua toggle_rails_console()", { bang = true })

toggleterm.setup(vim.tbl_deep_extend("force", { open_mapping = [[<C-\>]] }, opts))

