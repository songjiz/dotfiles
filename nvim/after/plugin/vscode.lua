local vscode_available, vscode = pcall(require, "vscode")

if vscode_available then
  vscode.setup({
    transparent = false,
  })
end

