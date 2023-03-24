local ok, gitsigns = pcall(require, "gitsigns")

if not ok then
  return
end

gitsigns.setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function keymap(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    keymap("n", "]c", function()
      if vim.wo.diff then return "]c" end
      vim.schedule(function() gs.next_hunk() end)
      return "<Ignore>"
    end, { expr=true })

    keymap("n", "[c", function()
      if vim.wo.diff then return "[c" end
      vim.schedule(function() gs.prev_hunk() end)
      return "<Ignore>"
    end, { expr=true })

    -- Actions
    keymap("n", "<Leader>gb", function() gs.blame_line({ full=true }) end)
    keymap("n", "<Leader>glb", gs.toggle_current_line_blame)

    -- Text object
    keymap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end
})
