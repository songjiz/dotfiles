local ok, github_theme = pcall(require, "github-theme")

if ok then
  github_theme.setup({
    theme_style = "light",
    transparent = false
  })
end
