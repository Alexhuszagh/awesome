
-- load core libraries
local math = require("math")
local capi = { screen = screen,
               awesome = awesome,
               dbus = dbus,
               timer = timer,
               awesome = awesome }

-- load modded awesome configurations
naughty_offset = loadrc("naughty_offset")

-- {{{ Signals

-- Connect signal
local function connect(wb, data)
  -- Connect enter to make tooltip
  wb:connect_signal("mouse::enter",
     function(c)
        if wb.hover_notification == nil  then
          local nt = data
          nt.screen = mouse.screen
          position = mouse.coords()
          -- underflow
          local char_count = char_count(data['text'], "\n")
          char_count = math.max(char_count-2, 1)
          position['y'] = position['y'] - (10*char_count)
          if position['x'] <= 50 then
            nt.position = "bottom_left"
            wb.hover_notification = naughty.notify(nt)
           -- greater than screen width
          elseif position['x'] + 200 > 1900 then
            nt.position = "bottom_right"
            wb.hover_notification = naughty.notify(nt)
          else
            nt.position = "bottom_right"
            nt.position_exact = position
            wb.hover_notification = naughty_offset.notify(nt)
          end
       end
     end)
  -- Connect leave event to destroy tooltip
  wb:connect_signal("mouse::leave",
     function(c)
        if wb.hover_notification ~= nil then
           naughty.destroy(wb.hover_notification)
           wb.hover_notification = nil
        end
     end)
end

-- Disconnect Signal

local function disconnect(wb, data)
  -- Disconnect enter to make tooltip
  wb:disconnect_signal("mouse::enter",
     function(c)
        if wb.hover_notification == nil  then
          local nt = data
          nt.screen = mouse.screen
          position = mouse.coords()
          -- underflow
          local char_count = char_count(data['text'], "\n")
          char_count = math.max(char_count-2, 1)
          position['y'] = position['y'] - (10*char_count)
          if position['x'] <= 50 then
            nt.position = "bottom_left"
            wb.hover_notification = naughty.notify(nt)
           -- greater than screen width
          elseif position['x'] + 200 > 1900 then
            nt.position = "bottom_right"
            wb.hover_notification = naughty.notify(nt)
          else
            nt.position = "bottom_right"
            nt.position_exact = position
            wb.hover_notification = naughty_offset.notify(nt)
          end
       end
     end)
  -- Disconnect leave event to destroy tooltip
  wb:disconnect_signal("mouse::leave",
     function(c)
        if wb.hover_notification ~= nil then
           naughty.destroy(wb.hover_notification)
           wb.hover_notification = nil
        end
     end)
end


-- }}}

-- {{{ Tooltip

function char_count(str, char)
    if not str then
        return 0
    end

    local count = 0
    local byte_char = string.byte(char)
    for i = 1, #str do
        if string.byte(str, i) == byte_char then
            count = count + 1
        end
    end
    return count
end

-- Adds a hovering tooltip over the widget
function add_hover_tooltip (arg)

  -- Bind connects
  connect(arg.wb, arg.data)
  -- Die signal for when the tooltip runs out
  if arg.timeout ~= nil then
    local timer_die = capi.timer { timeout = arg.timeout }
    timer_die:connect_signal("timeout",
      function()
        disconnect(arg.wb, arg.data)
      end)
    timer_die:start()
  end
end

-- }}} Tooltip

-- {{{ Run only once

function run_once(cmd)
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. cmd .. " > /dev/null || (" .. cmd .. ")")
end
-- }}}

-- {{{ Status Bar

local statusbar = { widgets = {}, wiboxes = {},
                    position = "bottom" }
local widgets = statusbar.widgets

-- Checks to see if the command is currently running
function running(cmd)
  fpid = io.popen("pgrep " .. cmd)
  if fpid ~= nil then
    pid = tonumber(fpid:read("*n"))
  else
    pid = nil
  end
  return pid
end

-- Binds the wibox to the active and inactive slots
function bind(wb, cmd, grep, icon, time, name, description, tag_number)
  -- Register to vicious
  vicious.register(wb,
  function ()
    pid = running(grep)
    if pid == nil then
      wb:set_image(iconDir .. icon .. ".png")
    else
      wb:set_image(iconDir .. icon .. "_active.png")
    end
  end, time)

  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
    findme = cmd:sub(0, firstspace-1)
  end
  -- Connect to tooltip
  data = {
      text = description,
      title = name,
      timeout = 0,
      icon=iconDir .. icon .. ".png"
  }
  add_hover_tooltip{wb=wb, data=data}

  -- Connect to a menu
  local quit = awful.util.getdir("config") .. "/sh/quitprocess.sh " .. cmd
  local kill = awful.util.getdir("config") .. "/sh/killprocess.sh " .. cmd
  local window = {{ "&Open", cmd },
                  { "&Quit", quit },
                  { "&Kill", kill }}
  local mywidgetmenu = awful.menu.new({ items = { {"Window", window} } })
  wb:buttons(awful.util.table.join(
    awful.button({ }, 1,
      function ()
        run_once(cmd)
      end,
      function()
        if tag_number ~= nil then
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[tag_number]
          if tag then
             awful.tag.viewonly(tag)
          end
        end
      end),
    awful.button({ }, 3, function ()
      awful.menu.toggle(mywidgetmenu)
    end)))
end

function statusbar.create(s)
   if not statusbar.initialized then
      statusbar.initialize()
   end
   local w = widgets
   local I = widgets.separator

   local wb = awful.wibox { position = statusbar.position,
                            screen = s,
                            height = 30,
                            --ontop = true,
                            sticky = true,
                            above = true }
    wb:set_bg("#101010")

   -- Widgets that are aligned to the top
   local top_layout = wibox.layout.fixed.vertical()

   -- Widgets that are aligned to the top
   local right_layout = wibox.layout.fixed.horizontal()
   loadrc("mpd")
   right_layout:add(musicwidget.widget)

   -- Widgets that are aligned to the bottom
   local bottom_layout = wibox.layout.fixed.horizontal()
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.menu_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.software_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.terminal_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.vim_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.geany_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.sublime_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)
   bottom_layout:add(w.thunderbird_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.pidgin_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)
   bottom_layout:add(w.spotify_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.ncmpcpp_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.clementine_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)
   bottom_layout:add(w.kindle_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.steam_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)
   bottom_layout:add(w.firefox_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.icecat_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.chromium_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.chrome_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)
   bottom_layout:add(w.nautilus_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.xpad_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.alarm_icon)
   bottom_layout:add(w.separator)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.vmware_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.gnumeric_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)
   bottom_layout:add(w.transmission_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.frostwire_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)
   bottom_layout:add(w.weather)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.battery_icon)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.logout_icon)
   -- Now bring it all together (with the tasklist in the middle)
   local layout = wibox.layout.align.vertical()
   -- layout:set_top(top_layout)
   layout:set_middle(right_layout)
   layout:set_bottom(bottom_layout)

   wb:set_widget(layout)
end

iconDir = awful.util.getdir("config") .. "/theme/icons/"

function statusbar.initialize()
    -- Menu
   widgets.menu_icon = awful.widget.button(
      { image = iconDir .. "start-here-arch3.png"})
   data = {
      text = "Load main menu",
      title = "Application Menu",
      timeout = 0,
      icon=iconDir .. "start-here-arch3.png"
  }
   add_hover_tooltip{wb=widgets.menu_icon, data=data}
   widgets.menu_icon:buttons(awful.util.table.join(
    awful.button({ }, 1,
      function ()
        awful.menu.toggle(mymainmenu)
      end)))

   -- Software Center
   widgets.software_icon = wibox.widget.imagebox()
   bind(widgets.software_icon, "software-center", "software-center",
        "softwarecenter", 1, "Ubuntu Software Center",
        "Software Center for Ubuntu Operating Systems", nil)

   widgets.spacer = wibox.widget.textbox()
   widgets.spacer:set_markup("      ")

   widgets.separator = wibox.widget.textbox()
   widgets.separator:set_markup("                  ")

   -- Terminal + Code Editors
   widgets.terminal_icon = wibox.widget.imagebox()
   bind(widgets.terminal_icon, "gnome-terminal", "gnome-terminal",
        "terminal", 1, "Terminal",
        "Gnome Terminal version 3.14.2 // Bash Shell", 4)

   widgets.vim_icon = wibox.widget.imagebox()
   bind(widgets.vim_icon, "gvim", "gvim", "vim", 1,
        "ViM", "Gnome ViM", 1)

   widgets.geany_icon = wibox.widget.imagebox()
   bind(widgets.geany_icon, "geany", "geany", "geany", 1,
        "Geany", "Geany Text Editor", 1)

   widgets.sublime_icon = wibox.widget.imagebox()
   bind(widgets.sublime_icon, "subl", "sublime", "sublime", 1,
        "Sublime", "Sublime Text Version 3", 1)

   -- Mail Apps and Messaging
   widgets.thunderbird_icon = wibox.widget.imagebox()
   bind(widgets.thunderbird_icon, "thunderbird", "thunderbird",
        "thunderbird", 1,  "Thunderbird", "Email Client", 9)

   widgets.pidgin_icon = wibox.widget.imagebox()
   bind(widgets.pidgin_icon, "pidgin", "pidgin", "pidgin", 1,
        "Pidgin", "Instant Messaging", 9)

   -- Music Players
   widgets.spotify_icon = wibox.widget.imagebox()
   bind(widgets.spotify_icon, "spotify", "spotify", "spotify", 1,
        "Spotify", "Streaming music", 6)

   widgets.ncmpcpp_icon = wibox.widget.imagebox()
   bind(widgets.ncmpcpp_icon, terminal .. " -e ncmpcpp", "ncmpcpp",
        "ncmpcpp", 1, "ncmpcpp", "MPD Client", 4)

   widgets.clementine_icon = wibox.widget.imagebox()
   bind(widgets.clementine_icon, "clementine", "clementine", "clementine",
        1, "Clementine", "Local music browser", 6)

   -- Media
   widgets.kindle_icon = wibox.widget.imagebox()
   bind(widgets.kindle_icon, 'playonlinux --run "Amazon Kindle" %F', "wine",
        "kindle", 1, "Kindle", "Book Reader", 6)

   widgets.steam_icon = wibox.widget.imagebox()
   bind(widgets.steam_icon, "steam", "steam", "steam", 1,
        "Steam", "Game Application Launcher", 6)

   -- Web Browsers
   widgets.firefox_icon = wibox.widget.imagebox()
   bind(widgets.firefox_icon, "firefox", "firefox", "firefox", 1,
        "Firefox", "Mass spectrometry // Protein Prospector Browser", 3)

   widgets.icecat_icon = wibox.widget.imagebox()
   bind(widgets.icecat_icon, "icecat", "icecat", "icecat", 1,
        "IceCat", "Mainly for testing", 3)

   widgets.chromium_icon = wibox.widget.imagebox()
   bind(widgets.chromium_icon, "chromium-browser", "chromium",
        "chromium", 1, "Chromium Browser", "Default browser", 3)

   widgets.chrome_icon = wibox.widget.imagebox()
   bind(widgets.chrome_icon, "google-chrome", "chrome", "chrome", 1,
        "Chrome", "Being lazy", 3)

   -- Utilities
   widgets.nautilus_icon = wibox.widget.imagebox()
   bind(widgets.nautilus_icon, "nautilus", "nautilus", "nautilus", 1,
        "Nautilus", "", 5)

   widgets.xpad_icon = wibox.widget.imagebox()
   bind(widgets.xpad_icon, "xpad", "xpad", "xpad", 1,
        "XPad", "Note taking", 8)

   widgets.alarm_icon = wibox.widget.imagebox()
   bind(widgets.alarm_icon, "alarm-clock-applet", "alarm-clock",
        "alarm-clock", 1, "Alarm Clock", "Manually configured alarm clocks", 9)

   -- Utilities
   widgets.vmware_icon = wibox.widget.imagebox()
   bind(widgets.vmware_icon, "vmware", "vmware", "vmware", 1,
        "VMware Workstation 11", "Virtual machines", 7)

   widgets.gnumeric_icon = wibox.widget.imagebox()
   bind(widgets.gnumeric_icon, "gnumeric", "gnumeric", "gnumeric", 1,
        "Numeric", "Spreadsheet Analysis", 2)

   -- Torrents
   widgets.frostwire_icon = wibox.widget.imagebox()
   bind(widgets.frostwire_icon, "frostwire", "frostwire", "frostwire", 1,
        "FrostWire", "P2P Transfer", nil)

   widgets.transmission_icon = wibox.widget.imagebox()
   bind(widgets.transmission_icon, "transmission-gtk", "transmission",
        "transmission", 1, "Transmission", "P2P BitTorrent client", nil)

   -- Applets
   widgets.weather = wibox.widget.imagebox()
   vicious.register(widgets.weather, vicious.widgets.weather,
      function (widget, args)
        -- Base params
        local weather = args["{weather}"]
        local sky = args["{sky}"]
        local timeout = 1800
        -- Check sky conditions
        if sky == "Overcast" then
          icon = iconDir ..  "weather-overcast.png"
        elseif sky == "Mostly Cloudy" then
          icon = iconDir ..  "weather-few-clouds.png"
        elseif sky == "Clear" then
          icon = iconDir ..  "weather-clear.png"
        elseif sky == "Mostly Clear" then
          icon = iconDir ..  "weather-clear.png"
        else
          icon = iconDir ..  "weather-few-clouds-night.png"
        end
        -- Set image
        widgets.weather:set_image(icon)
        -- Make hover tooltip
        data = {
           text = "City: " .. args['{city}'].. "\nWeather: " .. weather .. "\nSky Conditions: " .. sky .. "\nTemperature: " .. args['{tempc}'] .. "\nWind: " .. args['{wind}'] .. "\nHumidity: " .. args['{humid}'],
           title = "Current Weather Forecast",
           timeout = 0,
           icon=icon,
           offset=-50
        }
        add_hover_tooltip{wb=widgets.weather, data=data, timeout=timeout}
      end,
      timeout, "KSNA")


   -- System Utilities
   widgets.battery_icon = wibox.widget.imagebox()
   vicious.register(widgets.battery_icon, vicious.widgets.bat,
      function (widget, args)
        -- Base params
        local batteryprct = tonumber(args[2])
        local timeout = 30
        -- Set battery image
        if batteryprct == 100 then
          icon = iconDir ..  "battery-full.png"
        elseif batteryprct >= 67 and batteryprct <= 100 then
          icon = iconDir ..  "battery-good.png"
        elseif batteryprct >= 34 and batteryprct <= 66 then
          icon = iconDir ..  "battery-caution.png"
        elseif batteryprct >= 1 and batteryprct <= 33 then
          icon = iconDir ..  "battery-low.png"
        else
          icon = iconDir ..  "battery-main.png"
        end
        widgets.battery_icon:set_image(icon)
        -- Make hover tooltip
        data = {
           text = "Percentage: " .. args[2] .. "\nState: " .. args[1] .. "\nRemaining Time: " .. args[3] .. "\n",
           title = "Battery",
           timeout = 0,
           icon=icon
        }
        add_hover_tooltip{wb=widgets.battery_icon, data=data, timeout=timeout}
      end,
      timeout, "BAT0")

   widgets.logout_icon = wibox.widget.imagebox()
   widgets.logout_icon:set_image(iconDir ..  "logout.png")
   lgoutmenu = awful.menu({ items = {  { "Restart Awesome", awesome.restart },
                                       { "Logout", awesome.quit },
                                       { "Reboot", 'reboot' },
                                       { "Shutdown", 'poweroff' }}
                          })
   widgets.logout_icon:buttons(awful.util.table.join(
    awful.button({ }, 1,
      function ()
        awful.menu.toggle(lgoutmenu)
      end)))

end

for s = 1, screen.count() do
    statusbar.create(s)
end



-- }}}
