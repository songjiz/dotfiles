vim.o.encoding = 'utf-8'
vim.o.fileencodings = 'utf-8'

vim.o.autoread = true
vim.o.autowrite = true

vim.o.expandtab = true
vim.o.shiftround = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.laststatus = 3
vim.o.cmdheight = 1
vim.o.showcmd = true

vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

vim.o.list = true
vim.opt.listchars = { tab = '┊ ', trail = '∙', extends = '»', precedes = '«', nbsp = '∅' }

vim.o.timeoutlen = 400
vim.o.updatetime = 100
vim.o.lazyredraw = true

vim.opt.clipboard:append('unnamed', 'unnamedplus')

vim.o.pumheight = 10
vim.o.wildmode = 'list:longest,full'
vim.opt.wildignore:append {
  '*.git,*.svn,*.hg',
  '*.aux,*.out,*.toc',
  '*.jpg,*jpeg,*.tiff,*.gif,*.png,*.svg,*.bmp,*.psd,*.pdf',
  '*.wav,*.mp3,*.ogg,*.pcm',
  '*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc',
  '*.ttf,*.otf',
  '*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz',
  '*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps',
  '*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu,*.rpm,*.pkg',
  '*.o,*.obj,*.exe,*.dll,*.manifest',
  '*.spl,*.sw?',
  '*.DS_Store,*.keep',
  '*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex,*.luac',
  '.bundle,node_modules,build,dist,target,tmp',
  '*.rbc,.rbx,*.scssc,*.sassc,.sass-cache,*pyc,*.o,*.gem',
  'tags,*/target/*,*/cache/*,*/tmp/*',
}
vim.o.diffopt = 'internal,algorithm:patience,indent-heuristic'

vim.o.termguicolors = true
vim.cmd [[filetype plugin indent on]]
vim.g.tokyonight_style = 'night'
vim.g.vscode_style = 'dark'
vim.g.vscode_transparency = 1
vim.g.vscode_italic_comment = 1
vim.g.vscode_disable_nvimtree_bg = 1
vim.cmd [[colorscheme tokyonight]]
