-- put user settings here
-- this module will be loaded after everything else when the application starts
-- it will be automatically reloaded when saved

local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"
local lspconfig = require "plugins.lsp.config"

------------------------------ Themes ----------------------------------------

-- light theme:
-- core.reload_module("colors.summer")

--------------------------- Key bindings -------------------------------------

-- key binding:
-- keymap.add { ["ctrl+escape"] = "core:quit" }

------------------------------- Fonts ----------------------------------------

-- customize fonts:
--
-- font names used by lite:
-- style.font          : user interface
-- style.big_font      : big text in welcome screen
-- style.icon_font     : icons
-- style.icon_big_font : toolbar icons
-- style.code_font     : code

local font_size = 10
local big_font_size = 13
style.font = renderer.font.load(DATADIR .. "/fonts/FiraSans-Regular.ttf", font_size * SCALE)
style.big_font = style.font:copy(big_font_size * SCALE)
style.icon_font = renderer.font.load(DATADIR .. "/fonts/icons.ttf", font_size * SCALE, {antialiasing="grayscale", hinting="full"})
style.icon_big_font = style.icon_font:copy(big_font_size * SCALE)
style.code_font = renderer.font.load(DATADIR .. "/fonts/JetBrainsMono-Regular.ttf", font_size * SCALE)

lspconfig.tsserver.setup()
