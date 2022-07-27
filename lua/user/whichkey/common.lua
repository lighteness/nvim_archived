M = {}

function M.Hop()

  return {
    ["<leader>"] = {
      name = "Hop",
      l = { "<cmd>HopWordCurrentLine<cr>", "current line" },
      m = { "<cmd>HopAnywhereMW<cr>", "multi windows" },
      w = { "<cmd>HopWord<cr>", "word" },
      c = { "<cmd>HopChar1<cr>", "HopChar1" },
      L = { "<cmd>HopLine<cr>", "HopLine" },
    }
  }
end

function M.debug()
  return {
    d = {
      name = "Debug",
      d = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
      O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
      l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
      u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
      x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
      C = { "<cmd>lua require'dap'.clear_breakpoints()<cr>", "Clean Breakpoints" },
      L = { "<cmd>lua require'dap'.list_breakpoints()<cr>", "List Breakpoints" },
    },
  }
end

function M.test()
  return {
    t = {
      name = "Test",
      S = { "<cmd>UltestSummary<cr>", "Summary" },
      a = { "<cmd>Ultest<cr>", "All" },
      d = { "<cmd>UltestDebug<cr>", "Debug" },
      f = { "<cmd>TestFile<cr>", "File" },
      l = { "<cmd>TestLast<cr>", "Last" },
      n = { "<cmd>TestNearest<cr>", "Nearest" },
      o = { "<cmd>UltestOutput<cr>", "Output" },
      s = { "<cmd>TestSuite<cr>", "Suite" },
      v = { "<cmd>TestVisit<cr>", "Visit" },
    },

  }
end

function M.git()
  return {
    g = {
      name = "Git",
      g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
      },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      d = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Diff",
      },
    },

  }

end

function M.lsp()
  return {
    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      d = {
        "<cmd>Telescope lsp_document_diagnostics<cr>",
        "Document Diagnostics",
      },
      w = {
        "<cmd>Telescope lsp_workspace_diagnostics<cr>",
        "Workspace Diagnostics",
      },
      f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
      i = { "<cmd>LspInfo<cr>", "Info" },
      I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
      j = {
        "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>",
        "Next Diagnostic",
      },
      k = {
        "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
        "Prev Diagnostic",
      },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
      },
    },
  }

end

function M.packer()
  return {
    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

  }
end

function M.search()
  return {
    s = {
      name = "Search",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
    },
  }
end

function M.termial()
  return {
    T = {
      name = "Terminal",
      n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
      u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
      t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
      p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
      f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
      h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
      v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },

  }
end

function M.find()
  return {
    f = {
      name = "Find",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      f = { "<cmd>Telescope find_files<cr>", "Find files" },
      t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
      s = { "<cmd>Telescope grep_string<cr>", "Find String" },
      h = { "<cmd>Telescope help_tags<cr>", "Help" },
      H = { "<cmd>Telescope highlights<cr>", "Highlights" },
      i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
      l = { "<cmd>Telescope resume<cr>", "Last Search" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
    },
  }
end

function M.misc()
  return {
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Action" },
    v = { "<cmd>vsplit<cr>", "vsplit" },
    h = { "<cmd>split<cr>", "split" },
    w = { "<cmd>w<CR>", "Write" },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },

    ["b"] = {
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Buffers",
    },
    ["q"] = { "<cmd>q!<cr>", "Quit" },
    ["c"] = { "<cmd>Bdelete!<cr>", "Close Buffer" },
    ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
    ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },





    --[[
    r = {
      name = "refactoring",
      b = { "<cmd>lua require('refactoring').refactor('Extract Block')<cr>", "Extract Block" },
      i = { "<cmd>lua require('refactoring').refactor('Inline Variable')<cr>", "Inline Variable" },
    }
    --]]


  }
end

return M
