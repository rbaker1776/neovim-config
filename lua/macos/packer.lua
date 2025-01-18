local packerpath = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packerrepo = "https://github.com/wbthomason/packer.nvim"

-- install packer if not installed
if not (vim.uv or vim.loop).fs_stat(packerpath) then
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", packerrepo, packerpath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone packer.nvim:\n", "ErrorMsg" },
            { out },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

-- autocommand that reloads neovim and installs/updates/removes plugins when file is saved
vim.cmd([[ 
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
    return
end

-- add list of plugins to install
return packer.startup(function(use)
    use("wbthomason/packer.nvim") -- packer

    use("nvim-treesitter/nvim-treesitter")

    use({
        "nvim-treesitter/playground",
        requires = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter.configs").setup({
                playground = {
                    enable = true,
                    disable = {},
                    updatetime = 25,
                    persist_queries = false,
                }
            })
        end
    })

    -- colorschemes
    use("bluz71/vim-nightfly-guicolors")
    use("UtkarshVerma/molokai.nvim")
    use { "catppuccin/nvim", as = "catppuccin" }

    use("christoomey/vim-tmux-navigator") -- tmux and split navigation

    use("tpope/vim-surround")

    use("vim-scripts/ReplaceWithRegister")

    use("numToStr/Comment.nvim")

    use("nvim-lua/plenary.nvim")

    use("nvim-tree/nvim-tree.lua")

    use("kyazdani42/nvim-web-devicons")

    use("nvim-lualine/lualine.nvim")

    -- fuzzy finding
    use({ "nvim-telescope/telescope-fzf-native.nvim", run="make" })
    use({ "nvim-telescope/telescope.nvim", branch="0.1.x" })

    --use("~/projects/vimslides")

    -- autocomplete
    -- use("hrsh7th/nvim-cmp")
    -- use("hrsh7th/cmp-buffer")
    -- use("hrsh7th/cmp-path")

    -- use("L3MON4D3/LuaSnip")
    -- use("saadparwaiz1/cmp_luasnip")
    -- use("rafamadriz/friendly-snippets")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
