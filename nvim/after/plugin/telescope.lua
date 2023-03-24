local ok, telescope = pcall(require, "telescope")

if not ok then
  return
end


local ok, actions = pcall(require, "telescope.actions")

if not ok then
  return
end

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git", ".idea", ".vscode", "*.ttf" },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
      }
    }
  },
  pickers = {
    find_files = { hidden = true, follow = true }
  }
}

local keymap = vim.keymap

keymap.set("n", "<C-p>", function()
  require("telescope.builtin").find_files { previewer = false }
end)

keymap.set("n", "<Leader>ff", function()
  require("telescope.builtin").find_files { previewer = false }
end)

keymap.set("n", "<Leader>fg", function()
  require("telescope.builtin").git_files { previewer = false }
end)

keymap.set("n", "<Leader>fb", function()
  require("telescope.builtin").buffers { previewer = false }
end)

keymap.set("n", "<Leader>fs", function()
  require("telescope.builtin").search_history { previewer = false }
end)

keymap.set("n", "<Leader>ft", function()
  require("telescope.builtin").help_tags()
end)

keymap.set("n", "<Leader>fr", function()
  require("telescope.builtin").live_grep()
end)

