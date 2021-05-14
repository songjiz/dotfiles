highlight clear
syntax reset

let g:colors_name = "IntelliJ_Light"
let colors_name="IntelliJ_Light"

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
let s:gray2     = { 'gui': "#d6d6d6", 'cterm': '252'  }
let s:gray3     = { 'gui': "#eeeeee", 'cterm': '255'  }
let s:red0      = { 'gui': "#f50000", 'cterm': '196'  }
let s:red1      = { 'gui': "#e45649", 'cterm': '167'  }
let s:red2      = { 'gui': "#ffc8bd", 'cterm': '217'  }
let s:red3      = { 'gui': "#ffd5cc", 'cterm': '224'  }
let s:green0    = { 'gui': "#067d17", 'cterm': '22'   }
let s:green1    = { 'gui': "#edfced", 'cterm': '71'   }
let s:green2    = { 'gui': "#aadeaa", 'cterm': '114'  }
let s:green3    = { 'gui': "#bee6be", 'cterm': '151'  }
let s:yellow0   = { 'gui': "#c18401", 'cterm': '136'  }
let s:yellow1   = { 'gui': "#FFE959", 'cterm': '220'  }
let s:yellow3   = { 'gui': "#fcfaec", 'cterm': '230'  }
let s:blue0     = { 'gui': "#0033b3", 'cterm': '12'   }
let s:blue1     = { 'gui': "#0000ff", 'cterm': '20'   }
let s:blue2     = { 'gui': "#1750eb", 'cterm': '27'   }
let s:blue3     = { 'gui': "#008dde", 'cterm': '32'   }
let s:blue4     = { 'gui': "#a6d2ff", 'cterm': '68'   }
let s:blue5     = { 'gui': "#b6d2f2", 'cterm': '153'  }
let s:blue6     = { 'gui': "#c2d8f2", 'cterm': '110'  }
let s:purple0   = { 'gui': "#871094", 'cterm': '90'   }
let s:purple1   = { 'gui': "#ccccff", 'cterm': '127'  }
let s:cyan0     = { 'gui': "#00627a", 'cterm': '23'   }
let s:cyan1     = { 'gui': "#93d3e9", 'cterm': '116'  }
let s:brown0    = { 'gui': "#c37522", 'cterm': '130'  }
let s:pink0     = { 'gui': "#ffcccc", 'cterm': '218'  }

let s:fg         = s:black1
let s:bg         = s:white0
let s:gutter_bg  = s:color0
let s:comment_fg = s:gray0

" General Colors
call s:h("Normal", s:fg, s:bg, s:none)
call s:h("NonText", s:gray0, s:color0, s:none)
call s:h("Cursor", s:bg, s:blue0, s:none)
call s:h("CursorColumn", s:color0, s:yellow3, s:none)
call s:h("CursorLine", s:color0, s:gray3, s:none)
call s:h("LineNr", s:gray0, s:bg, s:none)
call s:h("CursorLineNr", s:fg, s:color0, s:none)
call s:h("DiffAdd", s:color0, s:green3, s:none)
call s:h("DiffChange", s:color0, s:blue6, s:none)
call s:h("DiffDelete", s:color0, s:gray3, s:none)
call s:h("DiffText", s:blue1, s:color0, s:none)
call s:h("ErrorMsg", s:fg, s:color0, s:none)
call s:h("ModeMsg", s:fg, s:color0, s:none)
call s:h("MoreMsg", s:fg, s:color0, s:none)
call s:h("WarningMsg", s:red0, s:color0, s:none)
call s:h("Question", s:purple0, s:color0, s:none)
call s:h("Pmenu", s:fg, s:gray3, s:none)
call s:h("PmenuSel", s:fg, s:blue4, s:none)
call s:h("PmenuSbar", s:color0, s:gray0, s:none)
call s:h("PmenuThumb", s:color0, s:gray3, s:none)
call s:h("IncSearch", s:fg, s:yellow1, s:none)
call s:h("Search", s:fg, s:yellow1, s:none)
call s:h("SpellBad", s:red0, s:color0, s:undercurl)
call s:h("SpellCap", s:yellow0, s:color0, s:undercurl)
call s:h("SpellLocal", s:yellow0, s:color0, s:undercurl)
call s:h("SpellRare", s:yellow0, s:color0, s:none)
call s:h("Visual", s:color0, s:blue4, s:none)
call s:h("VisualNOS", s:color0, s:blue4, s:none)
call s:h("ColorColumn", s:color0, s:gray3, s:none)
call s:h("Conceal", s:fg, s:color0, s:none)
call s:h("Directory", s:black0, s:color0, s:none)
call s:h("VertSplit", s:gray2, s:bg, s:none)
call s:h("Folded", s:fg, s:bg, s:italic)
call s:h("FoldColumn", s:fg, s:color0, s:none)
call s:h("SignColumn", s:fg, s:color0, s:none)
call s:h("MatchParen", s:cyan0, s:color0, s:underline)
call s:h("SpecialKey", s:fg, s:color0, s:none)
call s:h("Title", s:fg, s:color0, s:none)
call s:h("WildMenu", s:fg, s:color0, s:none)

" Syntax Colors
call s:h("Comment", s:comment_fg, s:color0, s:italic)
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

" VIM
call s:h('vimCommand', s:blue0, s:color0, s:none)
call s:h('vimIsCommand', s:purple0, s:color0, s:none)
call s:h('vimUserFunc', s:blue1, s:color0, s:none)
call s:h('vimHiClear', s:purple0, s:color0, s:none)
call s:h('vimOption', s:purple0, s:color0, s:none)
call s:h('vimEnvvar', s:purple0, s:color0, s:none)

" Ruby
call s:h("rubyControl", s:blue0, s:color0, s:none)
call s:h("rubyResponse", s:fg, s:color0, s:none)
call s:h("rubyEnglishBooleanOperator", s:blue0, s:color0, s:none)
call s:h('rubyClassNameTag', s:purple0, s:color0, s:none)
call s:h('rubyClassName', s:purple0, s:color0, s:none)
call s:h('rubyModuleName', s:purple0, s:color0, s:none)
call s:h('rubyConstant', s:purple0, s:color0, s:none)
call s:h('rubyCapitalizedMethod', s:purple0, s:color0, s:none)

" Javascript
call s:h("javaScriptIdentifier", s:blue0, s:color0, s:none)
call s:h("javaScriptFunction", s:blue0, s:color0, s:none)
call s:h("javaScriptBraces", s:fg, s:color0, s:none)
call s:h("javaScriptOperator", s:blue0, s:color0, s:none)
call s:h("jsStorageClass", s:blue0, s:color0, s:none)
call s:h("jsVariableDef", s:purple0, s:color0, s:none)
call s:h("jsFuncArgs", s:fg, s:color0, s:none)
call s:h("jsFunction", s:blue0, s:color0, s:none)
call s:h("jsFuncName", s:fg, s:color0, s:none)
call s:h("jsFuncCall", s:fg, s:color0, s:none)
call s:h("jsArrowFunction", s:fg, s:color0, s:none)
call s:h("jsThis", s:blue0, s:color0, s:none)
call s:h("jsDecorator", s:yellow0, s:color0, s:none)
call s:h("jsDecoratorFunction", s:yellow0, s:color0, s:none)
call s:h("jsClassKeyword", s:blue0, s:color0, s:none)
call s:h("jsModuleKeyword", s:blue0, s:color0, s:none)
call s:h("jsExtendsKeyword", s:blue0, s:color0, s:none)
call s:h("jsOperatorKeyword", s:blue0, s:color0, s:none)
call s:h("jsExportDefault", s:blue0, s:color0, s:none)
call s:h("jsClassDefinition", s:fg, s:color0, s:none)
call s:h("jsGlobalNodeObjects", s:blue0, s:color0, s:none)
call s:h("jsGlobalObjects", s:purple0, s:color0, s:none)

" XML
call s:h("xmlProcessingDelim", s:fg, s:color0, s:none)
call s:h("xmlDocTypeDecl", s:fg, s:color0, s:none)
call s:h("xmlTag", s:fg, s:color0, s:none)
call s:h("xmlTagName", s:blue0, s:color0, s:none)
call s:h("xmlAttrib", s:blue1, s:color0, s:none)
call s:h("xmlNamespace", s:purple0, s:color0, s:none)
call s:h("xmlEntity", s:blue1, s:color0, s:none)
call s:h("xmlEntityPunct", s:blue1, s:color0, s:none)
call s:h("xmlCdataStart", s:fg, s:color0, s:none)
call s:h("xmlCdataEnd", s:fg, s:color0, s:none)

" HTML
call s:h("htmlTag", s:fg, s:color0, s:none)
call s:h("htmlEndTag", s:fg, s:color0, s:none)
call s:h("htmlTagName", s:blue0, s:color0, s:none)
call s:h("htmlArg", s:blue1, s:color0, s:none)

" Haml
call s:h("hamlDocType", s:fg, s:color0, s:none)
call s:h("hamlDespacer", s:fg, s:color0, s:none)

" Slim
call s:h("slimDocType", s:fg, s:color0, s:none)
call s:h("slimInterpolationDelimiter", s:blue0, s:color0, s:none)

" ERB
call s:h("erubyDelimiter", s:blue1, s:color0, s:none)

" JSON
call s:h("jsonKeyword", s:purple0, s:color0, s:none)
call s:h("jsonBoolean", s:blue0, s:color0, s:none)
call s:h("jsonNull", s:blue0, s:color0, s:none)

" Markdown
call s:h("markdownHeadingRule", s:purple0, s:color0, s:none)
call s:h("markdownH1", s:purple0, s:color0, s:none)
call s:h("markdownH2", s:purple0, s:color0, s:none)
call s:h("markdownH3", s:purple0, s:color0, s:none)
call s:h("markdownH4", s:purple0, s:color0, s:none)
call s:h("markdownH5", s:purple0, s:color0, s:none)
call s:h("markdownH6", s:purple0, s:color0, s:none)
call s:h("markdownBoldItalic", s:blue0, s:color0, s:none)
call s:h("markdownBoldItalicDelimiter", s:blue0, s:color0, s:none)
call s:h("markdownAutomaticLink", s:blue3, s:color0, s:none)
call s:h("markdownLinkText", s:blue3, s:color0, s:none)
call s:h("markdownId", s:blue0, s:color0, s:none)
call s:h("markdownUrl", s:blue1, s:color0, s:none)
call s:h("markdownUrlTitle", s:gray0, s:color0, s:none)
call s:h("markdownCodeDelimiter", s:gray0, s:color0, s:none)
call s:h("markdownCode", s:gray0, s:color0, s:none)
call s:h("markdownCodeBlock", s:gray0, s:color0, s:none)
call s:h("markdownBlockquote", s:green1, s:color0, s:none)
call s:h("markdownRule", s:gray0, s:color0, s:none)

" SQL
call s:h("sqlStatement", s:blue0, s:color0, s:none)
call s:h("sqlType", s:blue0, s:color0, s:none)

" YAML
call s:h("yamlDocumentStart", s:fg, s:color0, s:none)
call s:h("yamlBlockMappingKey", s:blue0, s:color0, s:none)
call s:h("yamlNodeTag", s:fg, s:color0, s:none)
call s:h("yamlAnchor", s:blue1, s:color0, s:none)
call s:h("yamlAlias", s:blue1, s:color0, s:none)
call s:h("yamlBlockCollectionItemStart", s:fg, s:color0, s:none)
call s:h("yamlBool", s:fg, s:color0, s:none)

" git
call s:h("gitcommitHeader", s:fg, s:color0, s:none)
call s:h("gitcommitOnBranch", s:fg, s:color0, s:none)
call s:h("gitcommitBranch", s:purple0, s:color0, s:none)
call s:h("gitcommitComment", s:comment_fg, s:color0, s:none)
call s:h("gitcommitUnmerged", s:red1, s:color0, s:none)
call s:h("gitcommitSelectedType", s:green2, s:color0, s:none)
call s:h("gitcommitSelectedFile", s:green2, s:color0, s:none)
call s:h("gitcommitDiscardedType", s:red1, s:color0, s:none)
call s:h("gitcommitDiscardedFile", s:red1, s:color0, s:none)
call s:h("gitcommitUntrackedFile", s:cyan1, s:color0, s:none)
call s:h("gitcommitUnmergedFile", s:yellow1, s:color0, s:none)
call s:h("gitcommitFile", s:fg, s:color0, s:none)
call s:h('gitcommitOverflow', s:red1, s:color0, s:none)
call s:h('gitcommitBlank', s:red1, s:color0, s:none)
call s:h('gitcommitSummary', s:fg, s:color0, s:none)

" GitGutter
call s:h("GitGutterAdd", s:green2, s:gutter_bg, s:none)
call s:h("GitGutterDelete", s:gray3, s:gutter_bg, s:none)
call s:h("GitGutterChangeDelete", s:gray3, s:gutter_bg, s:none)
call s:h("GitGutterChange", s:blue6, s:gutter_bg, s:none)

" diff
call s:h("diffAdded", s:green2, s:gutter_bg, s:none)
call s:h("diffRemoved", s:red1, s:gutter_bg, s:none)
call s:h("diffChanged", s:blue6, s:gutter_bg, s:none)

" Delete Functions
delf s:h
