-- lua/ktrz-monokai/init.lua
local M = {}

M.defaults = {
  transparent_background = false,
  italic_comments = true,
  colors = {},
  custom_highlights = {},
}

M.config = vim.deepcopy(M.defaults)

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup(user_config)
  M.config = vim.tbl_deep_extend("force", M.defaults, user_config or {})
end

function M.load()
  local palette = require("ktrz-monokai.palette").colors
  local config = M.config

  -- Override palette with config.colors
  for k, v in pairs(config.colors) do
    palette[k] = v
  end

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "ktrz-monokai"

  -- Background handling
  local bg_color = config.transparent_background and "NONE" or palette.bg

  -- Editor Highlight Groups
  hi("Normal", { fg = palette.fg, bg = bg_color })
  hi("NormalFloat", { fg = palette.fg, bg = bg_color })
  hi("SignColumn", { bg = bg_color })
  hi("Cursor", { fg = palette.bg, bg = palette.cursor })
  hi("Visual", { bg = palette.selection })
  hi("LineNr", { fg = palette.line_nr, bg = bg_color })
  hi("CursorLine", { bg = palette.line_highlight })
  hi("CursorLineNr", { fg = palette.fg })
  hi("StatusLine", { fg = palette.fg, bg = palette.bg })
  hi("StatusLineNC", { fg = palette.line_nr, bg = palette.bg })
  hi("VertSplit", { fg = palette.line_nr })
  hi("Pmenu", { fg = palette.fg, bg = palette.line_highlight })
  hi("PmenuSel", { fg = palette.fg, bg = palette.selection })
  hi("Folded", { fg = palette.comment, bg = palette.line_highlight })

  -- Standard Syntax Groups
  hi("Comment", { fg = palette.comment, italic = config.italic_comments })
  hi("String", { fg = palette.string })
  hi("Character", { fg = palette.constant })
  hi("Number", { fg = palette.number })
  hi("Boolean", { fg = palette.constant })
  hi("Float", { fg = palette.number })

  hi("Identifier", { fg = palette.fg })
  hi("Function", { fg = palette.function_name })

  hi("Statement", { fg = palette.keyword })
  hi("Conditional", { fg = palette.keyword })
  hi("Repeat", { fg = palette.keyword })
  hi("Label", { fg = palette.keyword })
  hi("Operator", { fg = palette.keyword })
  hi("Keyword", { fg = palette.keyword })
  hi("Exception", { fg = palette.keyword })

  hi("PreProc", { fg = palette.keyword })
  hi("Include", { fg = palette.keyword })
  hi("Define", { fg = palette.keyword })
  hi("Macro", { fg = palette.keyword })
  hi("PreCondit", { fg = palette.keyword })

  hi("Type", { fg = palette.storage_type, italic = true })
  hi("StorageClass", { fg = palette.storage })
  hi("Structure", { fg = palette.storage_type })
  hi("Typedef", { fg = palette.storage_type })

  hi("Special", { fg = palette.constant })
  hi("SpecialChar", { fg = palette.constant })
  hi("Tag", { fg = palette.tag })
  hi("Delimiter", { fg = palette.fg })
  hi("SpecialComment", { fg = palette.comment })
  hi("Debug", { fg = palette.constant })

  hi("Underlined", { underline = true })
  hi("Title", { fg = palette.class_name, bold = true })
  hi("Error", { fg = palette.invalid })
  hi("Todo", { fg = palette.constant, bold = true })

  -- Treesitter Links
  hi("@function", { link = "Function" })
  hi("@function.call", { link = "Function" })
  hi("@keyword", { link = "Keyword" })
  hi("@variable", { link = "Identifier" })
  hi("@type", { link = "Type" })
  hi("@string", { link = "String" })
  hi("@comment", { link = "Comment" })
  hi("@constant", { link = "Constant" })
  hi("@parameter", { fg = palette.function_arg, italic = true })
  hi("@field", { fg = palette.fg })
  hi("@property", { fg = palette.fg })
  hi("@constructor", { link = "Function" })
  hi("@operator", { link = "Operator" })
  hi("@tag", { fg = palette.tag })
  hi("@tag.attribute", { fg = palette.tag_attr })
  hi("@tag.delimiter", { fg = palette.line_nr })

  -- Diagnostics
  hi("DiagnosticError", { fg = palette.error })
  hi("DiagnosticWarn", { fg = palette.warning })
  hi("DiagnosticInfo", { fg = palette.info })
  hi("DiagnosticHint", { fg = palette.hint })

  -- Telescope
  hi("TelescopePromptNormal", { fg = palette.fg, bg = palette.line_highlight })
  hi("TelescopePromptTitle", { fg = palette.bg, bg = palette.keyword })
  hi("TelescopePromptBorder", { fg = palette.line_highlight, bg = palette.line_highlight })
  hi("TelescopeNormal", { fg = palette.fg, bg = bg_color })
  hi("TelescopeBorder", { fg = palette.line_nr, bg = bg_color })
  hi("TelescopeSelection", { bg = palette.selection, bold = true })
  hi("TelescopeMatching", { fg = palette.constant, bold = true })

  -- Apply custom highlights
  for group, opts in pairs(config.custom_highlights) do
    hi(group, opts)
  end
end

return M
