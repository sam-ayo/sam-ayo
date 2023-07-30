-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- command to install missing plugins
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then 
    print("Cannot find packer")
    return
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim") 

    -- color scheme
    use("rafi/awesome-vim-colorschemes")
    use("bluz71/vmi-nightfly-guicolors") -- colorscheme might change if I don't like
    use("embark-theme/vim") 

    use("christoomey/vim-tmux-navigator") -- terminal navigation 

    use("szw/vim-maximizer") -- maximizes and restores current window 

    use("numToStr/Comment.nvim") -- comment lines with gc  

    use("nvim-tree/nvim-tree.lua") -- directory structure in neovim

    -- vim icons
    use("nvim-tree/nvim-web-devicons") 
    use("ryanoasis/vim-devicons")

    use("nvim-lualine/lualine.nvim") -- status bar at the bottom

    use("matze/vim-move") -- move lines of code

    -- fuzzy finder for files
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({"nvim-telescope/telescope.nvim", branch = "0.1.x"})
     
    -- in buffer terminal 
    use("tc50cal/vim-terminal")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
