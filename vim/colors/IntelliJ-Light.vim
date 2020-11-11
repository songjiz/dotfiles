set background=light
highlight clear
syntax reset

let g:colors_name = "IntelliJ-Light"
let colors_name="IntelliJ-Light"

" Sets the highlighting for the given group
fun! s:h(group, fg, bg, attr)
  if !empty(a:fg)
    exec "highlight " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . a:fg.cterm
  endif
  if !empty(a:bg)
    exec "highlight " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . a:bg.cterm
  endif
  if a:attr != ""
    exec "highlight " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfun

let s:none      = 'NONE'
let s:italic    = 'italic'
let s:underline = 'underline'
let s:undercurl = 'undercurl'
let s:color0    = { 'gui': s:none,    'cterm': s:none }
let s:white0    = { 'gui': "#ffffff", 'cterm': '255'  }
let s:black0    = { 'gui': "#000000", 'cterm': '0'    }
let s:black1    = { 'gui': "#080808", 'cterm': '232'  }
let s:gray0     = { 'gui': "#8c8c8c", 'cterm': '245'  }
let s:gray1     = { 'gui': "#f0f0f0", 'cterm': '237'  }
let s:red0      = { 'gui': "#f50000", 'cterm': '196'  }
let s:red1      = { 'gui': "#e45649", 'cterm': '167'  }
let s:green0    = { 'gui': "#067d17", 'cterm': '22'   }
let s:green1    = { 'gui': "#edfced", 'cterm': '71'   }
let s:yellow0   = { 'gui': "#c18401", 'cterm': '136'  }
let s:yellow1   = { 'gui': "#fcfaec", 'cterm': '230'  }
let s:blue0     = { 'gui': "#0033b3", 'cterm': '25'   }
let s:blue1     = { 'gui': "#0000ff", 'cterm': '21'   }
let s:blue2     = { 'gui': "#1750eb", 'cterm': '27'   }
let s:blue3     = { 'gui': "#008dde", 'cterm': '32'   }
let s:blue4     = { 'gui': "#a6d2ff", 'cterm': '153'  }
let s:purple0   = { 'gui': "#871094", 'cterm': '90'   }
let s:purple1   = { 'gui': "#ccccff", 'cterm': '127'  }
let s:cyan0     = { 'gui': "#00627a", 'cterm': '23'   }
let s:cyan1     = { 'gui': "#93d3e9", 'cterm': '116'  }
let s:brown0    = { 'gui': "#c37522", 'cterm': '130'  }
let s:pink0     = { 'gui': "#ffcccc", 'cterm': '218'  }
let s:fg        = s:black1
let s:bg        = s:white0

" General Colors
call s:h("Normal", s:fg, s:bg, s:none)
call s:h("NonText", s:gray0, s:color0, s:none)
call s:h("Cursor", s:bg, s:blue0, s:none)
call s:h("CursorColumn", s:color0, s:yellow1, s:none)
call s:h("CursorLine", s:color0, s:yellow1, s:none)
call s:h("LineNr", s:gray0, s:bg, s:none)
call s:h("CursorLineNr", s:fg, s:color0, s:none)
call s:h("DiffAdd", s:green0, s:color0, s:none)
call s:h("DiffChange", s:yellow0, s:color0, s:none)
call s:h("DiffDelete", s:red0, s:color0, s:none)
call s:h("DiffText", s:blue1, s:color0, s:none)
call s:h("ErrorMsg", s:fg, s:color0, s:none)
call s:h("ModeMsg", s:fg, s:color0, s:none)
call s:h("MoreMsg", s:fg, s:color0, s:none)
call s:h("WarningMsg", s:red0, s:color0, s:none)
call s:h("Question", s:purple0, s:color0, s:none)
call s:h("Pmenu", s:fg, s:yellow1, s:none)
call s:h("PmenuSel", s:bg, s:blue1, s:none)
call s:h("PmenuSbar", s:color0, s:yellow1, s:none)
call s:h("PmenuThumb", s:color0, s:gray0, s:none)
call s:h("IncSearch", s:bg, s:yellow0, s:none)
call s:h("Search", s:bg, s:yellow0, s:none)
call s:h("SpellBad", s:red0, s:color0, s:undercurl)
call s:h("SpellCap", s:yellow0, s:color0, s:undercurl)
call s:h("SpellLocal", s:yellow0, s:color0, s:undercurl)
call s:h("SpellRare", s:yellow0, s:color0, s:none)
call s:h("Visual", s:color0, s:blue4, s:none)
call s:h("VisualNOS", s:color0, s:blue4, s:none)
call s:h("ColorColumn", s:color0, s:yellow1, s:none)
call s:h("Conceal", s:fg, s:color0, s:none)
call s:h("Directory", s:black0, s:color0, s:none)
call s:h("VertSplit", s:fg, s:bg, s:none)
call s:h("Folded", s:fg, s:yellow1, s:none)
call s:h("FoldColumn", s:fg, s:yellow1, s:none)
call s:h("SignColumn", s:fg, s:color0, s:none)
call s:h("MatchParen", s:cyan0, s:color0, s:underline)
call s:h("SpecialKey", s:fg, s:color0, s:none)
call s:h("Title", s:fg, s:color0, s:none)
call s:h("WildMenu", s:fg, s:color0, s:none)

" Syntax Colors
call s:h("Comment", s:gray0, s:color0, s:italic)
call s:h("Constant", s:purple0, s:color0, s:none)
call s:h("String", s:green0, s:color0, s:none)
call s:h("Character", s:green0, s:color0, s:none)
call s:h("Number", s:blue1, s:color0, s:none)
call s:h("Boolean", s:blue0, s:color0, s:none)
call s:h("Float", s:yellow0, s:color0, s:none)
call s:h("Identifier", s:purple0, s:color0, s:none)
call s:h("Function", s:blue1, s:color0, s:none)
call s:h("Statement", s:fg, s:color0, s:none)
call s:h("Conditional", s:blue0, s:color0, s:none)
call s:h("Repeat", s:blue0, s:color0, s:none)
call s:h("Label", s:blue0, s:color0, s:none)
call s:h("Operator", s:fg, s:color0, s:none)
call s:h("Keyword", s:blue0, s:color0, s:none)
call s:h("Exception", s:purple0, s:color0, s:none)
call s:h("PreProc", s:yellow0, s:color0, s:none)
call s:h("Include", s:cyan0, s:color0, s:none)
call s:h("Define", s:blue0, s:color0, s:none)
call s:h("Macro", s:cyan0, s:color0, s:none)
call s:h("PreCondit", s:yellow0, s:color0, s:none)
call s:h("Type", s:purple0, s:color0, s:none)
call s:h("StorageClass", s:yellow0, s:color0, s:none)
call s:h("Structure", s:yellow0, s:color0, s:none)
call s:h("Typedef", s:yellow0, s:color0, s:none)
call s:h("Special", s:blue0, s:color0, s:none)
call s:h("SpecialChar", s:fg, s:color0, s:none)
call s:h("Tag", s:fg, s:color0, s:none)
call s:h("Delimiter", s:fg, s:color0, s:none)
call s:h("SpecialComment", s:fg, s:color0, s:none)
call s:h("Debug", s:fg, s:color0, s:none)
call s:h("Underlined", s:yellow0, s:color0, s:underline)
call s:h("Ignore", s:fg, s:color0, s:none)
call s:h("Error", s:red0, s:bg, s:none)
call s:h("Todo", s:blue3, s:color0, s:italic)

" Ruby
call s:h("rubyControl", s:blue0, s:color0, s:none)
call s:h("rubyResponse", s:fg, s:color0, s:none)

" Javascript
call s:h("javaScriptIdentifier", s:blue0, s:color0, s:none)
call s:h("javaScriptFunction", s:blue0, s:color0, s:none)
call s:h("javaScriptBraces", s:fg, s:color0, s:none)
call s:h("javaScriptOperator", s:blue0, s:color0, s:none)

" HTML
call s:h("htmlTag", s:fg, s:color0, s:none)
call s:h("htmlTagName", s:blue0, s:color0, s:none)
call s:h("htmlArg", s:blue1, s:color0, s:none)

" Delete Functions
delf s:h
