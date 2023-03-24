local ok, vscode = pcall(require, "vscode")

if ok then
  vscode.setup({
    transparent = false,
  })
end

