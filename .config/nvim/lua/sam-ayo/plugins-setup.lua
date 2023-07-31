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
    use("embark-theme/vim") 
    use("srcery-colors/srcery-vim")
    use("sainnhe/everforest")

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
    
    -- autocompletion 
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-buffer')

    -- snippets engines
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')
    use('rafamadriz/friendly-snippets')

    --- managing and installing lsp servers
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')

    -- configuring lsp servers
    use('neovim/nvim-lspconfig')

    if packer_bootstrap then
        require("packer").sync()
    end
end)
