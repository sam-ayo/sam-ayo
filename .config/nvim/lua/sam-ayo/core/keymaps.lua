vim.g.mapleader = " "

local keymap = vim.keymap 
local cmd = vim.cmd

-- general keymaps
keymap.set("i", "jj", "<ESC>") -- Move into normal mode from insert mode 
keymap.set("n", "<leader>pv", cmd.Ex) -- Neovim file explorer

-- split window
keymap.set("n", "<leader>sh", "<C-w>s") -- horizontally
keymap.set("n", "<leader>sv", "<C-w>v") -- vertically
keymap.set("n", "<leader>se", "<C-w>=") -- make neovim split windows equally
keymap.set("n", "<leader>sc", ":close<CR>") -- close current split window 

-- tab manager
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tc", ":tabclose<CR>") -- close currrent tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab


-- plugin keymaps 

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
local setup, nvim_api = pcall(require, "nvim-tree.api")
if not setup then 
    print("Cannot find nvim-tree-api")
    return
end
keymap.set("n", "<leader>k", nvim_api.tree.collapse_all)
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")


-- telescope fuzzy finder
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")

-- vim terminal
keymap.del("n", "<leader>t>")
keymap.set("n", "<leader>t", ":TerminalSplit zsh<CR>")

