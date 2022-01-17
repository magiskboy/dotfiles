require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,

  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,

  -- 'vertical' | 'horizontal' | 'window' | 'float',
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    -- 'single' | 'double' | 'shadow' | 'curved' |
    border = 'single',
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

-- Lazygit
local Terminal  = require('toggleterm.terminal').Terminal
vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>ToggleTerm<CR>", {noremap = true, silent = true})

local _lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function git() 
    _lazygit:toggle()
end

local _htop = Terminal:new({ cmd = "htop", hidden = true })
function htop()
    _htop:toggle()
end

local _python = Terminal:new({ cmd = "python", hidden = true })
function python()
    _python:toggle()
end

local _node = Terminal:new({ cmd = "node", hidden = true })
function node()
    _node:toggle()
end
