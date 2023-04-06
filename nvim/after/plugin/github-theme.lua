local github_theme_available, github_theme = pcall(require, "github-theme")

if github_theme_available then
  github_theme.setup({
    theme_style = "dark",
    transparent = true
  })
end
