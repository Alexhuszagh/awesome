-- Standard awesome library
gears = require("gears")
awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
wibox = require("wibox")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
naughty = require("naughty")
menubar = require("menubar")
vicious = require("vicious")
vicious.contrib = require("vicious.contrib")
-- Core lua libraries
lfs = require("lfs")

-- Load Debian menu entries
require("debian.menu")

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers

--{{---| Theme | -------------------------------------

-- Todo:  Please change the "ep" to your $USER
config_dir = awful.util.getdir("config")
themes_dir = (config_dir .. "/theme")
rc_dir = (config_dir .. "/rc")

beautiful.init(themes_dir .. "/theme.lua")

-- This is used later as the default terminal, browser and editor to run.
terminal = "x-terminal-emulator"
dropdown_terminal = "tilda"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor
browser = "chromium-browser"

font = "Inconsolata 15"

-- {{ These are the power arrow dividers/separators }} --
arr1 = wibox.widget.imagebox()
arr1:set_image(beautiful.arr1)
arr2 = wibox.widget.imagebox()
arr2:set_image(beautiful.arr2)
arr3 = wibox.widget.imagebox()
arr3:set_image(beautiful.arr3)
arr4 = wibox.widget.imagebox()
arr4:set_image(beautiful.arr4)
arr5 = wibox.widget.imagebox()
arr5:set_image(beautiful.arr5)
arr6 = wibox.widget.imagebox()
arr6:set_image(beautiful.arr6)
arr7 = wibox.widget.imagebox()
arr7:set_image(beautiful.arr7)
arr8 = wibox.widget.imagebox()
arr8:set_image(beautiful.arr8)
arr9 = wibox.widget.imagebox()
arr9:set_image(beautiful.arr9)

-- Default modkey.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Simple function to load additional LUA files from rc/.
function loadrc(name, mod)
   local success
   local result

   -- Which file? In rc/ or in lib/?
   local path = awful.util.getdir("config") .. "/" ..
      (mod and "lib" or "rc") ..
      "/" .. name .. ".lua"

   -- If the module is already loaded, don't load it again
   if mod and package.loaded[mod] then return package.loaded[mod] end

   -- Execute the RC/module file
   success, result = pcall(function() return dofile(path) end)
   if not success then
      naughty.notify({ title = "Error while loading an RC file",
           text = "When loading `" .. name ..
        "`, got the following error:\n" .. result,
           preset = naughty.config.presets.critical
         })
      return print("E: error loading RC file '" .. name .. "': " .. result)
   end

   -- Is it a module?
   if mod then
      return package.loaded[mod]
   end

   return result
end

-- {{{ Utils

function run_in_terminal(cmd)
  awful.util.spawn_with_shell('gnome-terminal -x bash -c "' .. cmd .. '"; exec $SHELL')
end

-- }}}

-- {{{ Bindings

globalkeys = {}
clientkeys = {}

-- }}}

-- Define spawn cmds

spawn_cmd = {
    ["ncmpcpp"] = function() awful.util.spawn_with_shell(terminal .. " -e ncmpcpp") end
}

-- Require private attributes first
loadrc("private")
-- Make widgets first
loadrc("menu")
loadrc("statusbar")
loadrc("widgets")
-- Set appearance, theming
loadrc("appearance")
loadrc("themes")
-- Load key bindings
require("lib/bindings/client")
require("lib/bindings/awesome")
require("lib/bindings/tags")
require("lib/bindings/launchers")
require("lib/bindings/layout")
require("lib/bindings/utils")
-- Process errors, set signals
loadrc("errors")
loadrc("signals")
-- Set layout tags and process screens
loadrc("tags")
--loadrc("xrandr")
-- Run applications and set rules
loadrc("xrun")
loadrc("rules")
