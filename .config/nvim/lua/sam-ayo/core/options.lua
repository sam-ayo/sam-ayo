local opt = vim.opt 

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.softtabstop = 4
opt.expandtab = true

-- mouse 
opt.mouse = "a"

-- line wrapping
opt.wrap = false

-- search settings 
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance 
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace 
opt.backspace = "indent,eol,start" 

-- clipboard 
opt.clipboard:append("unnamedplus")

-- split windows 
opt.splitright = true
opt.splitbelow = true







