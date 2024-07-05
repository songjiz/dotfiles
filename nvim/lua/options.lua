local opt = vim.opt
local fn  = vim.fn

opt.encoding      = "utf-8"
opt.fileencodings = "utf-8"

opt.autoread  = true
opt.autowrite = true

opt.expandtab   = true
opt.shiftround  = true
opt.smartindent = true
opt.autoindent  = true
opt.shiftwidth  = 2
opt.tabstop     = 2

opt.splitbelow = true
opt.splitright = true

opt.laststatus = 3
opt.cmdheight  = 1
opt.showcmd    = true

opt.smartcase  = true
opt.ignorecase = true
opt.hlsearch   = true
opt.incsearch  = true

opt.number         = true
opt.relativenumber = true

opt.cursorline = true

-- Allow backspace on indent, end of line or insert mode start position
opt.backspace = "indent,eol,start"

opt.list = true
opt.listchars = { tab = "┊ ", trail = "∙", extends = "»", precedes = "«", nbsp = "∅" }

opt.iskeyword:append("-")

opt.timeoutlen = 400
opt.updatetime = 100
opt.lazyredraw = true

opt.shortmess:append("c")
opt.clipboard:append("unnamed", "unnamedplus")
opt.matchpairs:append("<:>", "《:》", "（:）", "【:】")

opt.pumheight   = 10
opt.wildmode    = "list:longest,list:full"
opt.completeopt = "menu,menuone,noselect"
opt.wildignore:append {
  "*.git,*.svn,*.hg",
  "*.aux,*.out,*.toc",
  "*.jpg,*jpeg,*.tiff,*.gif,*.png,*.svg,*.bmp,*.psd,*.pdf",
  "*.wav,*.mp3,*.ogg,*.pcm",
  "*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc",
  "*.ttf,*.otf",
  "*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz",
  "*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps",
  "*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu,*.rpm,*.pkg",
  "*.o,*.obj,*.exe,*.dll,*.manifest",
  "*.spl,*.sw?",
  "*.DS_Store,*.keep",
  "*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex,*.luac",
  ".bundle,node_modules,build,dist,target,tmp",
  "*.rbc,.rbx,*.scssc,*.sassc,.sass-cache,*pyc,*.o,*.gem",
  "tags,*/target/*,*/cache/*,*/tmp/*",
}
opt.diffopt = "internal,algorithm:patience,indent-heuristic"

if fn.executable("rg") then
  opt.grepprg = "rg --vimgrep"

  --                 ┌ filename
  --                 │  ┌ line nr
  --                 │  │  ┌ column nr
  --                 │  │  │  ┌ error message
  --                 │  │  │  │
  opt.grepformat = "%f:%l:%c:%m"
end

opt.termguicolors = true
