local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- trigger PackerSync right after this file is saved
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "plugins.lua" },
  command = "source <afile> | PackerSync",
  once = true
})


-- ]]
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  --use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  --use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "phaazon/hop.nvim"
  use "windwp/nvim-autopairs"

  --use "akinsho/bufferline.nvim"
  --use "moll/vim-bbye"
  --use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  --use "lewis6991/impatient.nvim"
  --use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  --use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  --
  ---- Colorschemes
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "onsails/lspkind.nvim" -- display the fancy icons to completion-menu with lspkind-nvim.

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  --
  ---- LSP
  use { "williamboman/mason.nvim" }
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  --use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "RRethy/vim-illuminate"
  use "ray-x/lsp_signature.nvim"

  --
  ---- Telescope
  use "nvim-telescope/telescope.nvim"
  --
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  -- use "p00f/nvim-ts-rainbow"
  --use "nvim-treesitter/playground"

  --use "JoosepAlviste/nvim-ts-context-commentstring"
  --
  -- Git
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"
  --use "ruifm/gitlinker.nvim"
  --use "mattn/vim-gist"
  --use "mattn/webapi-vim"


  use 'mfussenegger/nvim-jdtls'

  -- DAP
  use { "mfussenegger/nvim-dap" }
  use { "rcarriga/nvim-dap-ui" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }
  use { "leoluz/nvim-dap-go" }
  use { "jbyuki/one-small-step-for-vimkind" }


  --test
  use {
    "rcarriga/vim-ultest",
    requires = {
      "vim-test/vim-test",
    },
    run = ":UpdateRemotePlugins"
  }

  use {
    "nvim-neotest/neotest",
    requires = {
      "vim-test/vim-test",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",

      'nvim-neotest/neotest-go',
      "nvim-neotest/neotest-vim-test"
    }
  }

  use "ThePrimeagen/refactoring.nvim"

  use 'majutsushi/tagbar'

  use 'ybian/smartim'

  use 'Pocco81/auto-save.nvim'

  -- Comment
  use "numToStr/Comment.nvim"
  use "folke/todo-comments.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
