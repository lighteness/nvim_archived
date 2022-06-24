require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  -- sync_install = false,

  -- List of parsers to ignore installing (for "all")

  highlight = {
    -- `false` will disable the whole extension
    enable = true

  },

  indent = {
    enable = true
  },
}

vim.opt.foldmethod=expr
vim.opt.foldexpr=nvim_treesitter#foldexpr()

-- allow treesitter to download parser via pandavpn
require("nvim-treesitter.install").command_extra_args = {
    curl = { "--proxy", "http://127.0.0.1:41091" },
}
