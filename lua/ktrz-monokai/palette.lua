-- lua/ktrz-monokai/palette.lua
local M = {}

M.colors = {
  bg = "#313437",
  fg = "#f8f8f8",
  cursor = "#f8f8f0",
  selection = "#2c4f69", 
  line_nr = "#5c6166",
  line_highlight = "#34373a", -- editor.lineHighlightBackground
  comment = "#5C6166",
  string = "#E6DB74",
  number = "#AE81FF",
  constant = "#AE81FF",
  keyword = "#F92672",
  storage = "#F92672",
  storage_type = "#66D9EF",
  class_name = "#A6E22E",
  function_name = "#A6E22E",
  function_arg = "#FD971F",
  tag = "#F92672",
  tag_attr = "#A6E22E",
  library_func = "#66D9EF",
  library_const = "#66D9EF",
  library_type = "#66D9EF",
  invalid = "#F8F8F8",
  diff_add = "#1e4c27", 
  diff_change = "#5c4f17",
  diff_delete = "#94151b",
  error = "#e61f44",
  warning = "#fd971f",
  info = "#2095f0",
  hint = "#4fc1ff",
  link = "#2095f0"
}

return M
