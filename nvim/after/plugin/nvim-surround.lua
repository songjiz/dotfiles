local surround_available, surround = pcall(require, "nvim-surround")

if not surround_available then
  return
end

surround.setup()
