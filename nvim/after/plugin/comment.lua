local comment_available, comment = pcall(require, "Comment")

if not comment_available then
  return
end

comment.setup()
