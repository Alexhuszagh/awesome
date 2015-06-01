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

font = "Inconsolata 11"

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
-- Usually, Mod4 is the key with a logo between Control and Alt.
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

-- Define spawn cmds

spawn_cmd = {
    ["ncmpcpp"] = function() awful.util.spawn_with_shell(terminal .. " -e ncmpcpp") end
}

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_Ahorizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end),
    -- bind PrintScrn to capture a screen
    awful.key(
        {},
        "Print",
        function()
            awful.util.spawn( "gnome-screenshot" ,false )
        end)
)

-- draw conky first, interferes with others
loadrc("menu")
loadrc("statusbar")
loadrc("widgets")
loadrc("appearance")
loadrc("themes")
loadrc("bindings")
loadrc("errors")
loadrc("signals")
loadrc("tags")
loadrc("xrandr")
loadrc("xrun")
loadrc("rules")
