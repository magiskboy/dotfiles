local actions = require "telescope.actions"

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim"
    },
    mappings = {
        i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous
        }
    },
    layout_config = {
      prompt_position = "top"
    },
    sorting_strategy = "ascending"
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('fzf')


vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', {})
vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>Telescope live_grep<cr>', {})
