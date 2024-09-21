if true then return {} end

-- Aborted attempt at modifying the highlights


local highlights = {
    ["@annotation"] = "PreProc",
    ["@attribute"] = "PreProc",
    ["@boolean"] = "Boolean",
    ["@character"] = "Character",
    ["@character.printf"] = "SpecialChar",
    ["@character.special"] = "SpecialChar",
    ["@comment"] = "Comment",
    ["@comment.error"] = {
      fg = "red1"
    },
    ["@comment.hint"] = {
      fg = "green1"
    },
    ["@comment.info"] = {
      fg = "blue2"
    },
    ["@comment.note"] = {
      fg = "green1"
    },
    ["@comment.todo"] = {
      fg = "blue"
    },
    ["@comment.warning"] = {
      fg = "yellow"
    },
    ["@constant"] = "Constant",
    ["@constant.builtin"] = "Special",
    ["@constant.macro"] = "Define",
    ["@constructor"] = {
      fg = "magenta"
    },
    ["@constructor.tsx"] = {
      fg = "blue1"
    },
    ["@diff.delta"] = "DiffChange",
    ["@diff.minus"] = "DiffDelete",
    ["@diff.plus"] = "DiffAdd",
    ["@function"] = "Function",
    ["@function.builtin"] = "Special",
    ["@function.call"] = "@function",
    ["@function.macro"] = "Macro",
    ["@function.method"] = "Function",
    ["@function.method.call"] = "@function.method",
    ["@keyword"] = {
      fg = "purple",
      italic = true
    },
    ["@keyword.conditional"] = "Conditional",
    ["@keyword.coroutine"] = "@keyword",
    ["@keyword.debug"] = "Debug",
    ["@keyword.directive"] = "PreProc",
    ["@keyword.directive.define"] = "Define",
    ["@keyword.exception"] = "Exception",
    ["@keyword.function"] = {
      fg = "magenta"
    },
    ["@keyword.import"] = "Include",
    ["@keyword.operator"] = "@operator",
    ["@keyword.repeat"] = "Repeat",
    ["@keyword.return"] = "@keyword",
    ["@keyword.storage"] = "StorageClass",
    ["@label"] = {
      fg = "blue"
    },
    ["@lsp.type.boolean"] = "@boolean",
    ["@lsp.type.builtinType"] = "@type.builtin",
    ["@lsp.type.comment"] = "@comment",
    ["@lsp.type.decorator"] = "@attribute",
    ["@lsp.type.deriveHelper"] = "@attribute",
    ["@lsp.type.enum"] = "@type",
    ["@lsp.type.enumMember"] = "@constant",
    ["@lsp.type.escapeSequence"] = "@string.escape",
    ["@lsp.type.formatSpecifier"] = "@markup.list",
    ["@lsp.type.generic"] = "@variable",
    ["@lsp.type.interface"] = {
      fg = "#83c3fc"
    },
    ["@lsp.type.keyword"] = "@keyword",
    ["@lsp.type.lifetime"] = "@keyword.storage",
    ["@lsp.type.namespace"] = "@module",
    ["@lsp.type.namespace.python"] = "@variable",
    ["@lsp.type.number"] = "@number",
    ["@lsp.type.operator"] = "@operator",
    ["@lsp.type.parameter"] = "@variable.parameter",
    ["@lsp.type.property"] = "@property",
    ["@lsp.type.selfKeyword"] = "@variable.builtin",
    ["@lsp.type.selfTypeKeyword"] = "@variable.builtin",
    ["@lsp.type.string"] = "@string",
    ["@lsp.type.typeAlias"] = "@type.definition",
    ["@lsp.type.unresolvedReference"] = {
      sp = "red1",
      undercurl = true
    },
    ["@lsp.type.variable"] = {},
    ["@lsp.typemod.class.defaultLibrary"] = "@type.builtin",
    ["@lsp.typemod.enum.defaultLibrary"] = "@type.builtin",
    ["@lsp.typemod.enumMember.defaultLibrary"] = "@constant.builtin",
    ["@lsp.typemod.function.defaultLibrary"] = "@function.builtin",
    ["@lsp.typemod.keyword.async"] = "@keyword.coroutine",
    ["@lsp.typemod.keyword.injected"] = "@keyword",
    ["@lsp.typemod.macro.defaultLibrary"] = "@function.builtin",
    ["@lsp.typemod.method.defaultLibrary"] = "@function.builtin",
    ["@lsp.typemod.operator.injected"] = "@operator",
    ["@lsp.typemod.string.injected"] = "@string",
    ["@lsp.typemod.struct.defaultLibrary"] = "@type.builtin",
    ["@lsp.typemod.type.defaultLibrary"] = {
      fg = "#589ed7"
    },
    ["@lsp.typemod.typeAlias.defaultLibrary"] = {
      fg = "#589ed7"
    },
    ["@lsp.typemod.variable.callable"] = "@function",
    ["@lsp.typemod.variable.defaultLibrary"] = "@variable.builtin",
    ["@lsp.typemod.variable.injected"] = "@variable",
    ["@lsp.typemod.variable.static"] = "@constant",
    ["@markup"] = "@none",
    ["@markup.emphasis"] = {
      italic = true
    },
    ["@markup.environment"] = "Macro",
    ["@markup.environment.name"] = "Type",
    ["@markup.heading"] = "Title",
    ["@markup.heading.1.markdown"] = {
      bold = true,
      fg = "blue"
    },
    ["@markup.heading.2.markdown"] = {
      bold = true,
      fg = "yellow"
    },
    ["@markup.heading.3.markdown"] = {
      bold = true,
      fg = "green"
    },
    ["@markup.heading.4.markdown"] = {
      bold = true,
      fg = "green1"
    },
    ["@markup.heading.5.markdown"] = {
      bold = true,
      fg = "magenta"
    },
    ["@markup.heading.6.markdown"] = {
      bold = true,
      fg = "purple"
    },
    ["@markup.italic"] = {
      italic = true
    },
    ["@markup.link"] = {
      fg = "green1"
    },
    ["@markup.link.label"] = "SpecialChar",
    ["@markup.link.label.symbol"] = "Identifier",
    ["@markup.link.url"] = "Underlined",
    ["@markup.list"] = {
      fg = "blue5"
    },
    ["@markup.list.checked"] = {
      fg = "green1"
    },
    ["@markup.list.markdown"] = {
      bold = true,
      fg = "orange"
    },
    ["@markup.list.unchecked"] = {
      fg = "blue"
    },
    ["@markup.math"] = "Special",
    ["@markup.raw"] = "String",
    ["@markup.raw.markdown_inline"] = {
      bg = "#444a73",
      fg = "blue"
    },
    ["@markup.strikethrough"] = {
      strikethrough = true
    },
    ["@markup.strong"] = {
      bold = true
    },
    ["@markup.underline"] = {
      underline = true
    },
    ["@module"] = "Include",
    ["@module.builtin"] = {
      fg = "red"
    },
    ["@namespace.builtin"] = "@variable.builtin",
    ["@none"] = {},
    ["@number"] = "Number",
    ["@number.float"] = "Float",
    ["@operator"] = {
      fg = "blue5"
    },
    ["@property"] = {
      fg = "green1"
    },
    ["@punctuation.bracket"] = {
      fg = "#828bb8"
    },
    ["@punctuation.delimiter"] = {
      fg = "blue5"
    },
    ["@punctuation.special"] = {
      fg = "blue5"
    },
    ["@string"] = "String",
    ["@string.documentation"] = {
      fg = "yellow"
    },
    ["@string.escape"] = {
      fg = "magenta"
    },
    ["@string.regexp"] = {
      fg = "blue6"
    },
    ["@tag"] = "Label",
    ["@tag.attribute"] = "@property",
    ["@tag.delimiter"] = "Delimiter",
    ["@tag.delimiter.tsx"] = {
      fg = "#6582c3"
    },
    ["@tag.javascript"] = {
      fg = "red"
    },
    ["@tag.tsx"] = {
      fg = "red"
    },
    ["@type"] = "Type",
    ["@type.builtin"] = {
      fg = "#589ed7"
    },
    ["@type.definition"] = "Typedef",
    ["@type.qualifier"] = "@keyword",
    ["@variable"] = {
      fg = "#c8d3f5"
    },
    ["@variable.builtin"] = {
      fg = "red"
    },
    ["@variable.member"] = {
      fg = "green1"
    },
    ["@variable.parameter"] = {
      fg = "yellow"
    },
    ["@variable.parameter.builtin"] = {
      fg = "#f4c990"
    },
    Bold = {
      bold = true,
      fg = "#c8d3f5"
    },
    BufferLineIndicatorSelected = {
      fg = "#7ca1f2"
    },
    Character = {
      fg = "green"
    },
    CmpDocumentation = {
      bg = "bg_dark",
      fg = "#c8d3f5"
    },
    CmpDocumentationBorder = {
      bg = "bg_dark",
      fg = "#589ed7"
    },
    CmpGhostText = {
      fg = "#444a73"
    },
    CmpItemAbbr = {
      bg = "NONE",
      fg = "#c8d3f5"
    },
    CmpItemAbbrDeprecated = {
      bg = "NONE",
      fg = "#3b4261",
      strikethrough = true
    },
    CmpItemAbbrMatch = {
      bg = "NONE",
      fg = "blue1"
    },
    CmpItemAbbrMatchFuzzy = {
      bg = "NONE",
      fg = "blue1"
    },
    CmpItemKindArray = "LspKindArray",
    CmpItemKindBoolean = "LspKindBoolean",
    CmpItemKindClass = "LspKindClass",
    CmpItemKindCodeium = {
      bg = "NONE",
      fg = "green1"
    },
    CmpItemKindColor = "LspKindColor",
    CmpItemKindConstant = "LspKindConstant",
    CmpItemKindConstructor = "LspKindConstructor",
    CmpItemKindCopilot = {
      bg = "NONE",
      fg = "green1"
    },
    CmpItemKindDefault = {
      bg = "NONE",
      fg = "#828bb8"
    },
    CmpItemKindEnum = "LspKindEnum",
    CmpItemKindEnumMember = "LspKindEnumMember",
    CmpItemKindEvent = "LspKindEvent",
    CmpItemKindField = "LspKindField",
    CmpItemKindFile = "LspKindFile",
    CmpItemKindFolder = "LspKindFolder",
    CmpItemKindFunction = "LspKindFunction",
    CmpItemKindInterface = "LspKindInterface",
    CmpItemKindKey = "LspKindKey",
    CmpItemKindKeyword = "LspKindKeyword",
    CmpItemKindMethod = "LspKindMethod",
    CmpItemKindModule = "LspKindModule",
    CmpItemKindNamespace = "LspKindNamespace",
    CmpItemKindNull = "LspKindNull",
    CmpItemKindNumber = "LspKindNumber",
    CmpItemKindObject = "LspKindObject",
    CmpItemKindOperator = "LspKindOperator",
    CmpItemKindPackage = "LspKindPackage",
    CmpItemKindProperty = "LspKindProperty",
    CmpItemKindReference = "LspKindReference",
    CmpItemKindSnippet = "LspKindSnippet",
    CmpItemKindString = "LspKindString",
    CmpItemKindStruct = "LspKindStruct",
    CmpItemKindSupermaven = {
      bg = "NONE",
      fg = "green1"
    },
    CmpItemKindTabNine = {
      bg = "NONE",
      fg = "green1"
    },
    CmpItemKindText = "LspKindText",
    CmpItemKindTypeParameter = "LspKindTypeParameter",
    CmpItemKindUnit = "LspKindUnit",
    CmpItemKindValue = "LspKindValue",
    CmpItemKindVariable = "LspKindVariable",
    CmpItemMenu = {
      bg = "NONE",
      fg = "#636da6"
    },
    ColorColumn = {
      bg = "black"
    },
    Comment = {
      fg = "#636da6",
      italic = true
    },
    Conceal = {
      fg = "#737aa2"
    },
    Constant = {
      fg = "orange"
    },
    CurSearch = "IncSearch",
    Cursor = {
      bg = "#c8d3f5",
      fg = "bg"
    },
    CursorColumn = {
      bg = "bg_highlight"
    },
    CursorIM = {
      bg = "#c8d3f5",
      fg = "bg"
    },
    CursorLine = {
      bg = "bg_highlight"
    },
    CursorLineNr = {
      bold = true,
      fg = "orange"
    },
    DapStoppedLine = {
      bg = "#38343d"
    },
    DashboardDesc = {
      fg = "cyan"
    },
    DashboardFiles = {
      fg = "blue"
    },
    DashboardFooter = {
      fg = "blue1"
    },
    DashboardHeader = {
      fg = "blue"
    },
    DashboardIcon = {
      bold = true,
      fg = "cyan"
    },
    DashboardKey = {
      fg = "orange"
    },
    DashboardMruIcon = {
      fg = "purple"
    },
    DashboardMruTitle = {
      fg = "cyan"
    },
    DashboardProjectIcon = {
      fg = "yellow"
    },
    DashboardProjectTitle = {
      fg = "cyan"
    },
    DashboardProjectTitleIcon = {
      fg = "orange"
    },
    DashboardShortCut = {
      fg = "cyan"
    },
    DashboardShortCutIcon = {
      fg = "magenta"
    },
    Debug = {
      fg = "orange"
    },
    Delimiter = "Special",
    DiagnosticError = {
      fg = "red1"
    },
    DiagnosticHint = {
      fg = "green1"
    },
    DiagnosticInfo = {
      fg = "blue2"
    },
    DiagnosticUnderlineError = {
      sp = "red1",
      undercurl = true
    },
    DiagnosticUnderlineHint = {
      sp = "green1",
      undercurl = true
    },
    DiagnosticUnderlineInfo = {
      sp = "blue2",
      undercurl = true
    },
    DiagnosticUnderlineWarn = {
      sp = "yellow",
      undercurl = true
    },
    DiagnosticUnnecessary = {
      fg = "#444a73"
    },
    DiagnosticVirtualTextError = {
      bg = "#322639",
      fg = "red1"
    },
    DiagnosticVirtualTextHint = {
      bg = "#273644",
      fg = "green1"
    },
    DiagnosticVirtualTextInfo = {
      bg = "#203346",
      fg = "blue2"
    },
    DiagnosticVirtualTextWarn = {
      bg = "#38343d",
      fg = "yellow"
    },
    DiagnosticWarn = {
      fg = "yellow"
    },
    DiffAdd = {
      bg = "#273849"
    },
    DiffChange = {
      bg = "#252a3f"
    },
    DiffDelete = {
      bg = "#3a273a"
    },
    DiffText = {
      bg = "blue7"
    },
    Directory = {
      fg = "blue"
    },
    EndOfBuffer = {
      fg = "bg"
    },
    Error = {
      fg = "red1"
    },
    ErrorMsg = {
      fg = "red1"
    },
    FlashBackdrop = {
      fg = "#545c7e"
    },
    FlashLabel = {
      bg = "magenta2",
      bold = true,
      fg = "#c8d3f5"
    },
    FloatBorder = {
      bg = "bg_dark",
      fg = "#589ed7"
    },
    FloatTitle = {
      bg = "bg_dark",
      fg = "#589ed7"
    },
    FoldColumn = {
      bg = "bg",
      fg = "#636da6"
    },
    Folded = {
      bg = "#3b4261",
      fg = "blue"
    },
    Foo = {
      bg = "magenta2",
      fg = "#c8d3f5"
    },
    Function = {
      fg = "blue"
    },
    GitSignsAdd = {
      fg = "#b8db87"
    },
    GitSignsChange = {
      fg = "#7ca1f2"
    },
    GitSignsDelete = {
      fg = "#e26a75"
    },
    GrugFarHelpHeader = {
      fg = "#636da6"
    },
    GrugFarHelpHeaderKey = {
      fg = "cyan"
    },
    GrugFarInputLabel = {
      fg = "blue1"
    },
    GrugFarInputPlaceholder = {
      fg = "#545c7e"
    },
    GrugFarResultsChangeIndicator = {
      fg = "#7ca1f2"
    },
    GrugFarResultsHeader = {
      fg = "orange"
    },
    GrugFarResultsLineColumn = {
      fg = "#545c7e"
    },
    GrugFarResultsLineNo = {
      fg = "#545c7e"
    },
    GrugFarResultsMatch = {
      bg = "red",
      fg = "black"
    },
    GrugFarResultsStats = {
      fg = "blue"
    },
    IblIndent = {
      fg = "#3b4261",
      nocombine = true
    },
    IblScope = {
      fg = "blue1",
      nocombine = true
    },
    Identifier = {
      fg = "magenta"
    },
    IncSearch = {
      bg = "orange",
      fg = "black"
    },
    IndentBlanklineChar = {
      fg = "#3b4261",
      nocombine = true
    },
    IndentBlanklineContextChar = {
      fg = "blue1",
      nocombine = true
    },
    Italic = {
      fg = "#c8d3f5",
      italic = true
    },
    Keyword = {
      fg = "cyan",
      italic = true
    },
    LazyProgressDone = {
      bold = true,
      fg = "magenta2"
    },
    LazyProgressTodo = {
      bold = true,
      fg = "#3b4261"
    },
    LineNr = {
      fg = "#3b4261"
    },
    LineNrAbove = {
      fg = "#3b4261"
    },
    LineNrBelow = {
      fg = "#3b4261"
    },
    LspCodeLens = {
      fg = "#636da6"
    },
    LspInfoBorder = {
      bg = "bg_dark",
      fg = "#589ed7"
    },
    LspInlayHint = {
      bg = "#24283c",
      fg = "#545c7e"
    },
    LspKindArray = "@punctuation.bracket",
    LspKindBoolean = "@boolean",
    LspKindClass = "@type",
    LspKindColor = "Special",
    LspKindConstant = "@constant",
    LspKindConstructor = "@constructor",
    LspKindEnum = "@lsp.type.enum",
    LspKindEnumMember = "@lsp.type.enumMember",
    LspKindEvent = "Special",
    LspKindField = "@variable.member",
    LspKindFile = "Normal",
    LspKindFolder = "Directory",
    LspKindFunction = "@function",
    LspKindInterface = "@lsp.type.interface",
    LspKindKey = "@variable.member",
    LspKindKeyword = "@lsp.type.keyword",
    LspKindMethod = "@function.method",
    LspKindModule = "@module",
    LspKindNamespace = "@module",
    LspKindNull = "@constant.builtin",
    LspKindNumber = "@number",
    LspKindObject = "@constant",
    LspKindOperator = "@operator",
    LspKindPackage = "@module",
    LspKindProperty = "@property",
    LspKindReference = "@markup.link",
    LspKindSnippet = "Conceal",
    LspKindString = "@string",
    LspKindStruct = "@lsp.type.struct",
    LspKindText = "@markup",
    LspKindTypeParameter = "@lsp.type.typeParameter",
    LspKindUnit = "@lsp.type.struct",
    LspKindValue = "@string",
    LspKindVariable = "@variable",
    LspReferenceRead = {
      bg = "#3b4261"
    },
    LspReferenceText = {
      bg = "#3b4261"
    },
    LspReferenceWrite = {
      bg = "#3b4261"
    },
    LspSignatureActiveParameter = {
      bg = "#262f50",
      bold = true
    },
    MatchParen = {
      bold = true,
      fg = "orange"
    },
    MiniIconsAzure = {
      fg = "blue2"
    },
    MiniIconsBlue = {
      fg = "blue"
    },
    MiniIconsCyan = {
      fg = "green1"
    },
    MiniIconsGreen = {
      fg = "green"
    },
    MiniIconsGrey = {
      fg = "#c8d3f5"
    },
    MiniIconsOrange = {
      fg = "orange"
    },
    MiniIconsPurple = {
      fg = "purple"
    },
    MiniIconsRed = {
      fg = "red"
    },
    MiniIconsYellow = {
      fg = "yellow"
    },
    MiniSurround = {
      bg = "orange",
      fg = "black"
    },
    ModeMsg = {
      bold = true,
      fg = "#828bb8"
    },
    MoreMsg = {
      fg = "blue"
    },
    MsgArea = {
      fg = "#828bb8"
    },
    NeoTreeDimText = {
      fg = "#3b4261"
    },
    NeoTreeFileName = {
      fg = "#828bb8"
    },
    NeoTreeGitModified = {
      fg = "orange"
    },
    NeoTreeGitStaged = {
      fg = "green1"
    },
    NeoTreeGitUntracked = {
      fg = "magenta"
    },
    NeoTreeNormal = {
      bg = "bg_dark",
      fg = "#828bb8"
    },
    NeoTreeNormalNC = {
      bg = "bg_dark",
      fg = "#828bb8"
    },
    NeoTreeTabActive = {
      bg = "bg_dark",
      bold = true,
      fg = "blue"
    },
    NeoTreeTabInactive = {
      bg = "#181a26",
      fg = "#545c7e"
    },
    NeoTreeTabSeparatorActive = {
      bg = "bg_dark",
      fg = "blue"
    },
    NeoTreeTabSeparatorInactive = {
      bg = "#181a26",
      fg = "bg"
    },
    NeotestAdapterName = {
      bold = true,
      fg = "purple"
    },
    NeotestBorder = {
      fg = "blue"
    },
    NeotestDir = {
      fg = "blue"
    },
    NeotestExpandMarker = {
      fg = "#828bb8"
    },
    NeotestFailed = {
      fg = "red"
    },
    NeotestFile = {
      fg = "green1"
    },
    NeotestFocused = {
      fg = "yellow"
    },
    NeotestIndent = {
      fg = "#828bb8"
    },
    NeotestMarked = {
      fg = "blue"
    },
    NeotestNamespace = {
      fg = "green2"
    },
    NeotestPassed = {
      fg = "green"
    },
    NeotestRunning = {
      fg = "yellow"
    },
    NeotestSkipped = {
      fg = "blue"
    },
    NeotestTarget = {
      fg = "blue"
    },
    NeotestTest = {
      fg = "#828bb8"
    },
    NeotestWinSelect = {
      fg = "blue"
    },
    NoiceCmdlineIconInput = {
      fg = "yellow"
    },
    NoiceCmdlineIconLua = {
      fg = "blue1"
    },
    NoiceCmdlinePopupBorderInput = {
      fg = "yellow"
    },
    NoiceCmdlinePopupBorderLua = {
      fg = "blue1"
    },
    NoiceCmdlinePopupTitleInput = {
      fg = "yellow"
    },
    NoiceCmdlinePopupTitleLua = {
      fg = "blue1"
    },
    NoiceCompletionItemKindArray = "LspKindArray",
    NoiceCompletionItemKindBoolean = "LspKindBoolean",
    NoiceCompletionItemKindClass = "LspKindClass",
    NoiceCompletionItemKindColor = "LspKindColor",
    NoiceCompletionItemKindConstant = "LspKindConstant",
    NoiceCompletionItemKindConstructor = "LspKindConstructor",
    NoiceCompletionItemKindDefault = {
      bg = "NONE",
      fg = "#828bb8"
    },
    NoiceCompletionItemKindEnum = "LspKindEnum",
    NoiceCompletionItemKindEnumMember = "LspKindEnumMember",
    NoiceCompletionItemKindEvent = "LspKindEvent",
    NoiceCompletionItemKindField = "LspKindField",
    NoiceCompletionItemKindFile = "LspKindFile",
    NoiceCompletionItemKindFolder = "LspKindFolder",
    NoiceCompletionItemKindFunction = "LspKindFunction",
    NoiceCompletionItemKindInterface = "LspKindInterface",
    NoiceCompletionItemKindKey = "LspKindKey",
    NoiceCompletionItemKindKeyword = "LspKindKeyword",
    NoiceCompletionItemKindMethod = "LspKindMethod",
    NoiceCompletionItemKindModule = "LspKindModule",
    NoiceCompletionItemKindNamespace = "LspKindNamespace",
    NoiceCompletionItemKindNull = "LspKindNull",
    NoiceCompletionItemKindNumber = "LspKindNumber",
    NoiceCompletionItemKindObject = "LspKindObject",
    NoiceCompletionItemKindOperator = "LspKindOperator",
    NoiceCompletionItemKindPackage = "LspKindPackage",
    NoiceCompletionItemKindProperty = "LspKindProperty",
    NoiceCompletionItemKindReference = "LspKindReference",
    NoiceCompletionItemKindSnippet = "LspKindSnippet",
    NoiceCompletionItemKindString = "LspKindString",
    NoiceCompletionItemKindStruct = "LspKindStruct",
    NoiceCompletionItemKindText = "LspKindText",
    NoiceCompletionItemKindTypeParameter = "LspKindTypeParameter",
    NoiceCompletionItemKindUnit = "LspKindUnit",
    NoiceCompletionItemKindValue = "LspKindValue",
    NoiceCompletionItemKindVariable = "LspKindVariable",
    NonText = {
      fg = "#545c7e"
    },
    Normal = {
      bg = "bg",
      fg = "#c8d3f5"
    },
    NormalFloat = {
      bg = "bg_dark",
      fg = "#c8d3f5"
    },
    NormalNC = {
      bg = "bg",
      fg = "#c8d3f5"
    },
    NormalSB = {
      bg = "bg_dark",
      fg = "#828bb8"
    },
    NotifyBackground = {
      bg = "bg",
      fg = "#c8d3f5"
    },
    NotifyDEBUGBody = {
      bg = "bg",
      fg = "#c8d3f5"
    },
    NotifyDEBUGBorder = {
      bg = "bg",
      fg = "#363a58"
    },
    NotifyDEBUGIcon = {
      fg = "#636da6"
    },
    NotifyDEBUGTitle = {
      fg = "#636da6"
    },
    NotifyERRORBody = {
      bg = "bg",
      fg = "#c8d3f5"
    },
    NotifyERRORBorder = {
      bg = "bg",
      fg = "#532b3f"
    },
    NotifyERRORIcon = {
      fg = "red1"
    },
    NotifyERRORTitle = {
      fg = "red1"
    },
    NotifyINFOBody = {
      bg = "bg",
      fg = "#c8d3f5"
    },
    NotifyINFOBorder = {
      bg = "bg",
      fg = "#1c5166"
    },
    NotifyINFOIcon = {
      fg = "blue2"
    },
    NotifyINFOTitle = {
      fg = "blue2"
    },
    NotifyTRACEBody = {
      bg = "bg",
      fg = "#c8d3f5"
    },
    NotifyTRACEBorder = {
      bg = "bg",
      fg = "#634b6c"
    },
    NotifyTRACEIcon = {
      fg = "purple"
    },
    NotifyTRACETitle = {
      fg = "purple"
    },
    NotifyWARNBody = {
      bg = "bg",
      fg = "#c8d3f5"
    },
    NotifyWARNBorder = {
      bg = "bg",
      fg = "#64554a"
    },
    NotifyWARNIcon = {
      fg = "yellow"
    },
    NotifyWARNTitle = {
      fg = "yellow"
    },
    Operator = {
      fg = "blue5"
    },
    Pmenu = {
      bg = "bg_dark",
      fg = "#c8d3f5"
    },
    PmenuSbar = {
      bg = "#27293a"
    },
    PmenuSel = {
      bg = "#363c58"
    },
    PmenuThumb = {
      bg = "#3b4261"
    },
    PreProc = {
      fg = "cyan"
    },
    Question = {
      fg = "blue"
    },
    QuickFixLine = {
      bg = "bg_visual",
      bold = true
    },
    RenderMarkdownBullet = {
      fg = "orange"
    },
    RenderMarkdownCode = {
      bg = "bg_dark"
    },
    RenderMarkdownCodeInline = "@markup.raw.markdown_inline",
    RenderMarkdownDash = {
      fg = "orange"
    },
    RenderMarkdownH1Bg = {
      bg = "#2c314a"
    },
    RenderMarkdownH1Fg = {
      bold = true,
      fg = "blue"
    },
    RenderMarkdownH2Bg = {
      bg = "#38343d"
    },
    RenderMarkdownH2Fg = {
      bold = true,
      fg = "yellow"
    },
    RenderMarkdownH3Bg = {
      bg = "#32383f"
    },
    RenderMarkdownH3Fg = {
      bold = true,
      fg = "green"
    },
    RenderMarkdownH4Bg = {
      bg = "#273644"
    },
    RenderMarkdownH4Fg = {
      bold = true,
      fg = "green1"
    },
    RenderMarkdownH5Bg = {
      bg = "#32304a"
    },
    RenderMarkdownH5Fg = {
      bold = true,
      fg = "magenta"
    },
    RenderMarkdownH6Bg = {
      bg = "#383148"
    },
    RenderMarkdownH6Fg = {
      bold = true,
      fg = "purple"
    },
    RenderMarkdownTableHead = {
      fg = "red"
    },
    RenderMarkdownTableRow = {
      fg = "orange"
    },
    Search = {
      bg = "bg_search",
      fg = "#c8d3f5"
    },
    SignColumn = {
      bg = "bg",
      fg = "#3b4261"
    },
    SignColumnSB = {
      bg = "bg_dark",
      fg = "#3b4261"
    },
    Special = {
      fg = "blue1"
    },
    SpecialKey = {
      fg = "#545c7e"
    },
    SpellBad = {
      sp = "red1",
      undercurl = true
    },
    SpellCap = {
      sp = "yellow",
      undercurl = true
    },
    SpellLocal = {
      sp = "blue2",
      undercurl = true
    },
    SpellRare = {
      sp = "green1",
      undercurl = true
    },
    Statement = {
      fg = "magenta"
    },
    StatusLine = {
      bg = "bg_dark",
      fg = "#828bb8"
    },
    StatusLineNC = {
      bg = "bg_dark",
      fg = "#3b4261"
    },
    String = {
      fg = "green"
    },
    Substitute = {
      bg = "red",
      fg = "black"
    },
    TabLine = {
      bg = "bg_dark",
      fg = "#3b4261"
    },
    TabLineFill = {
      bg = "black"
    },
    TabLineSel = {
      bg = "blue",
      fg = "black"
    },
    TelescopeBorder = {
      bg = "bg_dark",
      fg = "#589ed7"
    },
    TelescopeNormal = {
      bg = "bg_dark",
      fg = "#c8d3f5"
    },
    TelescopePromptBorder = {
      bg = "bg_dark",
      fg = "orange"
    },
    TelescopePromptTitle = {
      bg = "bg_dark",
      fg = "orange"
    },
    TelescopeResultsComment = {
      fg = "#545c7e"
    },
    Title = {
      bold = true,
      fg = "blue"
    },
    Todo = {
      bg = "yellow",
      fg = "bg"
    },
    TreesitterContext = {
      bg = "#363c58"
    },
    TroubleCount = {
      bg = "#3b4261",
      fg = "magenta"
    },
    TroubleNormal = {
      bg = "bg_dark",
      fg = "#c8d3f5"
    },
    TroubleText = {
      fg = "#828bb8"
    },
    Type = {
      fg = "blue1"
    },
    Underlined = {
      underline = true
    },
    VertSplit = {
      fg = "black"
    },
    Visual = {
      bg = "bg_visual"
    },
    VisualNOS = {
      bg = "bg_visual"
    },
    WarningMsg = {
      fg = "yellow"
    },
    WhichKey = {
      fg = "cyan"
    },
    WhichKeyDesc = {
      fg = "magenta"
    },
    WhichKeyGroup = {
      fg = "blue"
    },
    WhichKeyNormal = {
      bg = "bg_dark"
    },
    WhichKeySeparator = {
      fg = "#636da6"
    },
    WhichKeySeperator = {
      fg = "#636da6"
    },
    WhichKeyValue = {
      fg = "#737aa2"
    },
    Whitespace = {
      fg = "#3b4261"
    },
    WildMenu = {
      bg = "bg_visual"
    },
    WinBar = "StatusLine",
    WinBarNC = "StatusLineNC",
    WinSeparator = {
      bold = true,
      fg = "black"
    },
    debugBreakpoint = {
      bg = "#203346",
      fg = "blue2"
    },
    debugPC = {
      bg = "bg_dark"
    },
    diffAdded = {
      fg = "#b8db87"
    },
    diffChanged = {
      fg = "#7ca1f2"
    },
    diffFile = {
      fg = "blue"
    },
    diffIndexLine = {
      fg = "magenta"
    },
    diffLine = {
      fg = "#636da6"
    },
    diffNewFile = {
      fg = "orange"
    },
    diffOldFile = {
      fg = "yellow"
    },
    diffRemoved = {
      fg = "#e26a75"
    },
    dosIniLabel = "@property",
    healthError = {
      fg = "red1"
    },
    healthSuccess = {
      fg = "green1"
    },
    healthWarning = {
      fg = "yellow"
    },
    helpCommand = {
      bg = "#444a73",
      fg = "blue"
    },
    helpExample = {
      fg = "#636da6"
    },
    htmlH1 = {
      bold = true,
      fg = "magenta"
    },
    htmlH2 = {
      bold = true,
      fg = "blue"
    },
    lCursor = {
      bg = "#c8d3f5",
      fg = "bg"
    },
    qfFileName = {
      fg = "blue"
    },
    qfLineNr = {
      fg = "#737aa2"
    }
}
local colors = {
    bg = "bg",
    bg_dark = "bg_dark",
    bg_float = "bg_dark",
    bg_highlight = "bg_highlight",
    bg_popup = "bg_dark",
    bg_search = "blue0",
    bg_sidebar = "bg_dark",
    bg_statusline = "bg_dark",
    bg_visual = "bg_visual",
    black = "black",
    blue = "blue",
    blue0 = "blue0",
    blue1 = "blue1",
    blue2 = "blue2",
    blue5 = "blue5",
    blue6 = "blue6",
    blue7 = "blue7",
    border = "black",
    border_highlight = "#589ed7",
    comment = "#636da6",
    cyan = "cyan",
    dark3 = "#545c7e",
    dark5 = "#737aa2",
    diff = {
      add = "#273849",
      change = "#252a3f",
      delete = "#3a273a",
      text = "blue7"
    },
    error = "red1",
    fg = "#c8d3f5",
    fg_dark = "#828bb8",
    fg_float = "#c8d3f5",
    fg_gutter = "#3b4261",
    fg_sidebar = "#828bb8",
    git = {
      add = "#b8db87",
      change = "#7ca1f2",
      delete = "#e26a75",
      ignore = "#545c7e"
    },
    green = "green",
    green1 = "green1",
    green2 = "green2",
    hint = "green1",
    info = "blue2",
    magenta = "magenta",
    magenta2 = "magenta2",
    none = "NONE",
    orange = "orange",
    purple = "purple",
    rainbow = { "blue", "yellow", "green", "green1", "magenta", "purple" },
    red = "red",
    red1 = "red1",
    teal = "green1",
    terminal_black = "#444a73",
    todo = "blue",
    warning = "yellow",
    yellow = "yellow"
  }

local function on_highlights(hl, c)
    -- hl.Function = hl.String
    -- hl.Special = c.green
    -- hl['@keyword'] = hl.String
    -- hl['@variable'] = hl.String
    -- hl.String = hl.Constant
    -- hl.Character = c.fg
end

--[[
local util = require('tokyonight.util')
hl.String = { fg = c.orange }
hl.Character = { fg = c.orange2 }
hl.Function = { fg = c.yellow }
hl['@variable.parameter'] = { fg = c.fg_bright }
hl.Operator = { fg = c.magenta }
-- hl['@operator'] = { fg = c.magenta }
hl['@label.markdown'] = { link = 'NonText' }
hl['@markup.raw.delimiter.markdown'] = { link = 'NonText' }
hl.DiagnosticUnnecessary = { link = 'DiagnosticUnderlineHint' }

hl.MailQuoted1 = { fg = c.comment }
hl.MailQuoted2 = { fg = util.darken(c.teal, 0.8) }

hl.TreesitterContext = { bg = c.bg_context }
hl.MatchParen = { bg = c.bg_highlight, bold = true }
hl.Search = { bg = c.dark3, underline = false }
hl.IncSearch = { bg = c.dark4, underline = true }

hl.Folded = { fg = c.blue, bg = c.bg_blue }
hl.LineNr = { fg = c.dark5, bold = true }
hl.LineNrAbove = { fg = c.dark5 }
hl.LineNrBelow = { fg = c.dark5 }
hl.CursorLineNr = { fg = c.fg_dark }
hl.LspInlayHint = { fg = c.dark4 }
hl.MatchupVirtualText = { fg = c.dark5 }
hl.WhichKeyFloat = { bg = c.bg_darker }
hl.VimtexPopupContent = { bg = c.bg_darker }
-- hl.MsgArea = { bg = c.none }
hl.NoiceMini = { bg = c.bg_highlight }

-- hl.DiffAdd = { bg = c.green3 }
-- hl.DiffChange = { bg = c.diff.change }
hl.DiffDelete = { fg = c.dark4, bg = c.dark2 }
-- hl.DiffText = { bg = c.diff.text }
hl.LazyH1 = { fg = c.bg_dark, bg = c.orange }

-- hl.TelescopeBorder = { fg = c.border_highlight, bg = c.none }
-- hl.TelescopeNormal = { fg = c.fg, bg = c.none }
hl.TelescopeSelection = { bg = c.bg_context, bold = true }
hl.TelescopeSelectionCaret = { fg = c.purple, bg = c.bg_context }

hl.CmpItemKindSnippet = { fg = c.fg_bright }
hl.PmenuThumb = { bg = c.border_highlight }
hl.PmenuSel = { bg = c.bg_highlight, bold = true }
hl.FloatDarker = { fg = c.border_highlight, bg = c.bg_darker }
hl.FloatBorder = { fg = c.border_highlight, bg = c.bg_float, blend = 0 }
hl.FloatermBorder = { link = 'FloatBorder' }
--]]


return {
    {
        'folke/tokyonight.nvim',
        opts = {
            style = 'moon',
            on_highlights = on_highlights,
        },
    },
}