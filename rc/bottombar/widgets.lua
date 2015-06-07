iconDir = awful.util.getdir("config") .. "/theme/icons/"
local widgets = statusbar.widgets

-- Makes the widgets for the statusbar
function statusbar.initialize()
  -- Utils
  widgets.spacer = wibox.widget.textbox()
  widgets.spacer:set_markup("      ")

  widgets.separator = wibox.widget.textbox()
  widgets.separator:set_markup("                  ")

    -- Menu
  local wb = awful.widget.button({ image = iconDir .. "start-here-arch3.png"})
  local tooltip = {
      text = "Load main menu",
      title = "Application Menu",
      timeout = 0,
      icon=iconDir .. "start-here-arch3.png"
  }
  widgets.menu = { wibox=wb, tooltip=tooltip }
  widgets.menu.wibox:buttons(awful.util.table.join(
  awful.button({ }, 1,
    function ()
      awful.menu.toggle(mymainmenu)
    end)))
  add_hover_tooltip(widgets.menu)

  -- Software Center
  local wb = wibox.widget.imagebox()
  local data = {
    cmd="software-center",
    grep="software-center",
    icon="softwarecenter",
    time=1,
    name="Ubuntu Software Center",
    description="Software Center for Ubuntu Operating Systems"
  }
  widgets.software = {wibox=wb, data=data}

  -- Terminal + Code Editors
  local wb = wibox.widget.imagebox()
  local data = {
    cmd="gnome-terminal",
    pgrep="gnome-terminal",
    icon="terminal",
    time=1,
    name="Terminal",
    description="Gnome Terminal version 3.14.2 // Bash Shell",
    tag_number=4
  }
  widgets.terminal = {wibox=wb, data=data}

  local wb = wibox.widget.imagebox()
  local data = {
    cmd="gvim",
    grep="gvim",
    icon="vim",
    time=1,
    name="ViM",
    description="Gnome ViM",
    tag_number=1
  }
  widgets.vim = {wibox=wb, data=data}


  local wb = wibox.widget.imagebox()
  local data = {
    cmd="geany",
    grep="geany",
    icon="geany",
    time=1,
    name="Geany",
    description="Geany Text Editor",
    tag_number=1
  }
  widgets.geany = {wibox=wb, data=data}

  local wb = wibox.widget.imagebox()
  local data = {
    cmd="subl -n",
    grep="subl",
    icon="sublime",
    time=1,
    name="Sublime",
    description="Sublime Text Version 3",
    tag_number=1
  }
  widgets.sublime = {wibox=wb, data=data}

  -- Mail Apps and Messaging
  local wb = wibox.widget.imagebox()
  local data = {
    cmd="thunderbird",
    pgrep="thunderbird",
    icon="thunderbird",
    time=1,
    name="Thunderbird",
    description="Thunderbird Email Client",
    tag_number=9
  }
  widgets.thunderbird = {wibox=wb, data=data}

  local wb = wibox.widget.imagebox()
  local data = {
    cmd="pidgin",
    pgrep="pidgin",
    icon="pidgin",
    time=1,
    name="Pidgin",
    description="Instant Messaging",
    tag_number=9
  }
  widgets.pidgin = {wibox=wb, data=data}

  -- Music Players
  local wb = wibox.widget.imagebox()
  local data = {
    cmd="spotify",
    pgrep="spotify",
    icon="spotify",
    time=1,
    name="Spotify",
    description="Streaming music",
    tag_number=6
  }
  widgets.spotify = {wibox=wb, data=data}

  local wb = wibox.widget.imagebox()
  local data = {
    cmd=terminal .. " -e ncmpcpp",
    pgrep="ncmpcpp",
    icon="ncmpcpp",
    time=1,
    name="ncmpcpp",
    description="MPD Client",
    tag_number=4
  }
  widgets.ncmpcpp = {wibox=wb, data=data}

  local wb = wibox.widget.imagebox()
  local data = {
    cmd="clementine",
    pgrep="clementine",
    icon="clementine",
    time=1,
    name="Clementine",
    description="Local music browser",
    tag_number=6
  }
  widgets.clementine = {wibox=wb, data=data}

  -- Media
  local wb = wibox.widget.imagebox()
  local data = {
    cmd='playonlinux --run "Amazon Kindle" %F',
    pgrep="wine",
    icon="kindle",
    time=1,
    name="Kindle",
    description="Book Reader",
    tag_number=6
  }
  widgets.kindle = {wibox=wb, data=data}

  local wb = wibox.widget.imagebox()
  local data = {
    cmd="steam",
    pgrep="steam",
    icon="steam",
    time=1,
    name="Steam",
    description="Game Application Launcher",
    tag_number=6
  }
  widgets.steam = {wibox=wb, data=data}

  -- Web Browsers
  local wb = wibox.widget.imagebox()
  local data = {
    cmd="firefox",
    pgrep="firefox",
    icon="firefox",
    time=1,
    name="Firefox",
    description="Mass spectrometry // Protein Prospector Browser",
    tag_number=3
  }
  widgets.firefox = {wibox=wb, data=data}

  local wb = wibox.widget.imagebox()
  local data = {
    cmd="icecat",
    pgrep="icecat",
    icon="icecat",
    time=1,
    name="IceCat",
    description="Mainly for testing",
    tag_number=3
  }
  widgets.icecat = {wibox=wb, data=data}

  local wb = wibox.widget.imagebox()
  local data = {
    cmd="chromium-browser",
    pgrep="chromium",
    icon="chromium",
    time=1,
    name="Chromium Browser",
    description="Default browser",
    tag_number=3
  }
  widgets.chromium = {wibox=wb, data=data}

  local wb = wibox.widget.imagebox()
  local data = {
    cmd="google-chrome",
    pgrep="chrome",
    icon="chrome",
    time=1,
    name="Chrome",
    description="Being lazy",
    tag_number=3
  }
  widgets.chrome = {wibox=wb, data=data}

  -- Tool/ General Utilities
  local wb = wibox.widget.imagebox()
  local data = {
    cmd="nautilus",
    pgrep="nautilus",
    icon="nautilus",
    time=1,
    name="Nautilus",
    description="File Manager",
    tag_number=5
  }
  widgets.nautilus = {wibox=wb, data=data}

  local wb = wibox.widget.imagebox()
  local data = {
    cmd="xpad",
    pgrep="xpad",
    icon="xpad",
    time=1,
    name="XPad",
    description="Note Taking",
    tag_number=5
  }
  widgets.xpad = {wibox=wb, data=data}

  local wb = wibox.widget.imagebox()
  local data = {
    cmd="alarm-clock-applet",
    pgrep="alarm-clock",
    icon="alarm-clock",
    time=1,
    name="Alarm Clock",
    description="Manually configured alarm clocks",
    tag_number=9
  }
  widgets.alarm = {wibox=wb, data=data}

   -- Utilities
  local wb = wibox.widget.imagebox()
  local data = {
    cmd="vmware",
    grep="vmware",
    icon="vmware",
    time=1,
    name="VMware Workstation 11",
    description="Virtual machines",
    tag_number=7
  }
  widgets.vmware = {wibox=wb, data=data}

  local wb = wibox.widget.imagebox()
  local data = {
    cmd="gnumeric",
    pgrep="gnumeric",
    icon="gnumeric",
    time=1,
    name="Numeric",
    description="Spreadsheet Analysis",
    tag_number=2
  }
  widgets.gnumeric = {wibox=wb, data=data}

   -- Torrents
  local wb = wibox.widget.imagebox()
  local data = {
    cmd="frostwire",
    pgrep="frostwire",
    icon="frostwire",
    time=1,
    name="FrostWire",
    description="P2P Transfer"
  }
  widgets.frostwire = {wibox=wb, data=data}

  local wb = wibox.widget.imagebox()
  local data = {
    cmd="transmission-gtk",
    grep="transmission-gtk",
    icon="transmission",
    time=1,
    name="Transmission",
    description="P2P BitTorrent client"
  }
  widgets.transmission = {wibox=wb, data=data}

  -- Applets
  local wb = wibox.widget.imagebox()
  widgets.weather = {wibox=wb, timeout=1800}
  vicious.register(wb, vicious.widgets.weather,
    function (widget, args)
      -- Base params
      local weather = args["{weather}"]
      local sky = args["{sky}"]
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
      widgets.weather.wibox:set_image(icon)
      -- Make hover tooltip
      local data = {
         text = "City: " .. args['{city}'].. "\nWeather: " .. weather .. "\nSky Conditions: " .. sky .. "\nTemperature: " .. args['{tempc}'] .. "\nWind: " .. args['{wind}'] .. "\nHumidity: " .. args['{humid}'],
         title = "Current Weather Forecast",
         timeout = 0,
         icon=icon,
         offset=-50
      }
      widgets.weather.tooltip = data
      add_hover_tooltip(widgets.weather)
    end,
    1800, "KSNA")

  -- System Utilities
  local wb = wibox.widget.imagebox()
  widgets.battery = {wibox=wb, timeout=30}
  vicious.register(widgets.battery, vicious.widgets.bat,
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
      widgets.battery.wibox:set_image(icon)
      -- Make hover tooltip
      data = {
         text = "Percentage: " .. args[2] .. "\nState: " .. args[1] .. "\nRemaining Time: " .. args[3] .. "\n",
         title = "Battery",
         timeout = 0,
         icon=icon
      }
      widgets.battery.tooltip = data
      add_hover_tooltip(widgets.battery)
    end,
  timeout, "BAT0")

  local wb = wibox.widget.imagebox()
  wb:set_image(iconDir ..  "logout.png")
  wb:buttons(awful.util.table.join(
    awful.button({ }, 1,
      function ()
        awful.menu.toggle(lgoutmenu)
      end)))
  lgoutmenu = awful.menu({ items = {  { "Restart Awesome", awesome.restart },
                                      { "Logout", awesome.quit },
                                      { "Reboot", 'reboot' },
                                      { "Shutdown", 'poweroff' }}
                         })
  widgets.logout = {wibox=wb, timeout=30}

  -- Bind Widgets
  for index, widget in pairs(widgets) do
    bind(widget)
  end

end
