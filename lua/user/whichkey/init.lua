local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local common = require("user.whichkey.common")
local java = require("user.whichkey.java")
local go = require("user.whichkey.go")

local mappingsForV = {
  r = {
    name = "refactoring",
    f = { "<Esc><cmd>lua require('refactoring').refactor('Extract Function')<cr>", "Extract Function" },
    v = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<cr>", "Extract Variable" },
    i = { "<Esc><cmd>lua require('refactoring').refactor('Inline Variable')<cr>", "Inline Variable" },
    r = { "<Esc><cmd>lua require('refactoring').select_refactor()<cr>", "select_refactor" },


  },
}

local function opt()
  return {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
      border = "rounded", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
  }


end

function opts_for_normal_node()
  return {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

end

function opts_for_visual_node()
  return {
    mode = "v", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

function register_for(fileTypePattern, list_n, list_v)

  vim.api.nvim_create_autocmd("FileType", {
    once = true,
    group = vim.api.nvim_create_augroup("whichkey" .. "-" .. fileTypePattern, { clear = true }),
    pattern = fileTypePattern,
    callback = function()

      for _, value in ipairs(list_n) do
        which_key.register(value(), opts_for_normal_node())
      end

      for _, value in ipairs(list_v) do
        which_key.register(value(), opts_for_visual_node())
      end

    end
  })
end

function register_for_common()
  local list = {
    common.Hop,
    common.debug,
    common.git,
    common.lsp,
    common.packer,
    common.search,
    common.termial,
    common.misc,
    common.find,
  }
  for _, fn in ipairs(list) do
    which_key.register(fn(), opts)
  end

end

function register_for_common_in_visual_mode()
  local list = {
    common.debug_v_mode
  }
  for _, fn in ipairs(list) do
    which_key.register(fn(), opts_for_visual_node())
  end

end

function setup()

  which_key.setup(opt())

  register_for_common()
  register_for_common_in_visual_mode()

  register_for("java", {
    java.test_for_java,
    java.refactoring_in_the_mod_of("normal"),
  }, {
    java.refactoring_in_the_mod_of("visual"),
  })

  register_for("go", {
    go.test,
  }, {
  })

  which_key.register({
    a = { "<Esc><cmd>lua vim.lsp.buf.code_action()<cr>", "Action" },
  }, opts_for_visual_node())

end

setup()
