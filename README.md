# ktrz-monokai.nvim

A Neovim port of the [KTRZ Monokai](https://marketplace.visualstudio.com/items?itemName=ktrz.ktrz-monokai-color-theme) VSCode theme.
Written in Lua, with support for Treesitter, Telescope, and more.

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
return {
  "sasagar/ktrz-monokai.nvim",
  name = "ktrz-monokai",
  opts = {
    -- Optional config
    transparent_background = false,
    italic_comments = true,
  },
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use({
  "sasagar/ktrz-monokai.nvim",
  config = function()
    require("ktrz-monokai").setup({
      -- Optional config
      transparent_background = false,
      italic_comments = true,
    })
    vim.cmd("colorscheme ktrz-monokai")
  end,
})
```

## Usage

```vim
colorscheme ktrz-monokai
```

## Configuration

You can configure the theme by passing a table to the `setup` function. Here are the default values:

```lua
require("ktrz-monokai").setup({
  transparent_background = false, -- Disable background color
  italic_comments = true, -- Enable italic comments
  
  -- Override specific colors
  -- See lua/ktrz-monokai/palette.lua for all available keys
  colors = {
    -- bg = "#000000",
  },
  
  -- Override specific highlight groups
  custom_highlights = {
    -- Normal = { fg = "#ff0000" },
  },
})
```

### Overriding Colors

You can overwrite any color in the palette.

```lua
require("ktrz-monokai").setup({
  colors = {
    bg = "#1a1b26", -- Change background color
    function_name = "#ff0000", -- Change function names to red
  }
})
```

### Custom Highlights

You can also add or modify specific highlight groups using `custom_highlights`.

```lua
require("ktrz-monokai").setup({
  custom_highlights = {
    LineNr = { fg = "#ff00ff" }, -- Change line number color
    MyCustomGroup = { fg = "#00ff00", bold = true }, -- Add a new highlight group
  }
})
```
