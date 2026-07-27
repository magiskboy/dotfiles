-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.cmd("syntax on")
vim.opt.termguicolors = true
vim.g.mapleader = ","
vim.o.shell = "/bin/zsh"
vim.o.wrap = true
vim.o.showcmd = false
vim.o.autoindent = true
vim.o.cursorline = true
vim.o.ignorecase = false
vim.o.lazyredraw = true
vim.o.mouse = "a"
vim.o.number = true
vim.o.numberwidth = 5
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.undofile = true
vim.o.undodir = "/tmp/nvim"
vim.o.wildmenu = true
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.laststatus = 3
vim.o.path = vim.o.path .. "**"
vim.o.updatetime = 100

vim.swapfile = true
vim.backup = true

local python_host = "/usr/local/bin/python"
vim.g.python_host_prog = python_host
vim.g.python3_host_prog = python_host

vim.diagnostic.config({
  virtual_text = true
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "javascript", "typescript", "typescriptreact", "javascriptreact",
        "xml", "yaml", "json", "html", "css", "sass", "scss", "less", "jinja", "htmldjango"
    },
    callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.tabstop = 2
        vim.bo.expandtab = true
    end
})

vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    callback = function()
        vim.diagnostic.open_float(nil, {focus=false})
    end
})

vim.api.nvim_create_autocmd("ExitPre", {
	group = vim.api.nvim_create_augroup("Exit", { clear = true }),
	command = "set guicursor=a:ver90",
	desc = "Set cursor back to beam when leaving Neovim."
})

function _G.run(cmd)
  vim.fn.jobstart(cmd, {
    on_exit = function(args, exit_code)
      if exit_code == 0 then
        vim.notify("Command completed: " .. cmd, "info", { timeout = 3000 })
      else
        vim.notify("Command failed: " .. cmd, "error", { timeout = 5000 })
      end
    end,
  })
end


require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})

