vim.cmd('packadd packer.nvim')

local packer = require'packer'

--- startup and add configure plugins
packer.startup(function()
  local use = use
  use 'wbthomason/packer.nvim' -- Package manager

  -- syntax highlyters
  use { 'nvim-treesitter/nvim-treesitter', {run = ":TSUpdate"} }
  use 'sheerun/vim-polyglot'

  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'MaskRay/ccls'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
        require("rose-pine").setup()
        vim.cmd('colorscheme rose-pine')
      end
    })

  use 'theprimeagen/harpoon'
end)

