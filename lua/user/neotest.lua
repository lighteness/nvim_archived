require("neotest").setup({
  adapters = {
    require('neotest-go'),
    require("neotest-vim-test"),

  },
})


vim.api.nvim_exec([[
  let g:ultest_deprecation_notice = 0

  "  let test#java#runner = 'gradletest'

]], false)
