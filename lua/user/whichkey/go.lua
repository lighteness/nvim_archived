
M = {}

function M.test()
  return {
    t = {
      name = "Test",
      t = { "<Cmd>lua require('dap-go').debug_test()<cr>", "dap" },
      n = { "<Cmd>lua require('neotest').run.run()<cr>", "Test Nearest Method" },
      l = { "<Cmd>lua require('neotest').run.run_last()<cr>", "Test Last" },
      f = { "<Cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Current File" },
      o = { "<Cmd>lua require('neotest').output.open()<cr>", "output" },
      O = { "<Cmd>lua require('neotest').summary.toggle()<cr>", "summary" },
      S = { "<Cmd>lua require('neotest').run.stop()<cr>", "stop" },
      A = { "<Cmd>lua require('neotest').run.attach()<cr>", "attach" },
      j = { "<Cmd>lua require('neotest').jump.next()<cr>", "jumpt to next" },
      k = { "<Cmd>lua require('neotest').run.prev()<cr>", "jump to previous" },
    }
  }
end

return M
