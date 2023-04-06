local telescope_available, telescope = pcall(require, "telescope")

if not telescope_available then
  return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", "%.idea$", "%.vscode$" },
    vimgrep_arguments = {
      "rg",
      "--vimgrep",
      "--hidden",
      "--smart-case",
      "--follow",
    },
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.send_selected_to_loclist + actions.open_loclist
      }
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      follow = true,
      previewer = false,
      find_command = { "rg", "--ignore", "--files", "--hidden" },
      prompt_prefix = " 🔍 "
    }
  }
})

local keymap = vim.keymap

keymap.set("n", "<C-p>", builtin.find_files)
keymap.set("n", "<Leader>ff", builtin.find_files)
keymap.set("n", "<Leader>fg", builtin.git_files)
keymap.set("n", "<Leader>fb", builtin.buffers)
keymap.set("n", "<Leader>fs", builtin.search_history)
keymap.set("n", "<Leader>ft", builtin.current_buffer_tags)
keymap.set("n", "<Leader>fr", builtin.live_grep)
keymap.set("n", "<Leader>fq", builtin.quickfix)
keymap.set("n", "<Leader>fl", builtin.loclist)

