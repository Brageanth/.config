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

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        requires = {
          {'nvim-lua/plenary.nvim'},
          {'BurntSushi/ripgrep'}
        }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use({ 
        'rose-pine/neovim', 
        as = 'rose-pine' 
    })
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use 'mbbill/undotree'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'L3MON4D3/LuaSnip'},
            {'onsails/lspkind.nvim'},
            {'saadparwaiz1/cmp_luasnip'}
        }
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use "lewis6991/gitsigns.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use({ 
        "iamcco/markdown-preview.nvim", 
        run = "cd app && npm install", 
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, 
        ft = { "markdown" },
    })
    use "prettier/vim-prettier"
    use "sindrets/diffview.nvim" 
    use 'norcalli/nvim-colorizer.lua'
    use "FabijanZulj/blame.nvim"
    use {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    }
    use {
        "glepnir/template.nvim"
    }
    use({
    	  "L3MON4D3/LuaSnip",
	      tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    	  run = "make install_jsregexp"
    })
    use {
      'christoomey/vim-tmux-navigator',
      lazy = false
    }
    if packer_bootstrap then
       require('packer').sync()
    end
end)
