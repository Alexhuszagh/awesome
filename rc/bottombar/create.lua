local widgets = statusbar.widgets

-- Initializes the statusbar
function statusbar.create(s)
   if not statusbar.initialized then
      statusbar.initialize()
   end
   local w = widgets
   local I = widgets.separator

   local wb = awful.wibox { position = statusbar.position,
                            screen = s,
                            height = 30,
                            ontop = true,
                            sticky = true,
                            above = true,
                            floating = false }
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
   bottom_layout:add(w.menu.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.software.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)

   bottom_layout:add(w.spacer)
   bottom_layout:add(w.terminal.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.vim.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.geany.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.sublime.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)

   bottom_layout:add(w.thunderbird.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.pidgin.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)

   bottom_layout:add(w.spotify.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.ncmpcpp.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.clementine.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)

   bottom_layout:add(w.kindle.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.steam.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)

   bottom_layout:add(w.firefox.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.icecat.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.chromium.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.chrome.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)

   bottom_layout:add(w.nautilus.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.xpad.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.alarm.wibox)
   bottom_layout:add(w.separator)

   bottom_layout:add(w.spacer)
   bottom_layout:add(w.vmware.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.gnumeric.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)

   bottom_layout:add(w.transmission.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.frostwire.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.separator)

   bottom_layout:add(w.weather.wibox)
   bottom_layout:add(w.spacer)

   bottom_layout:add(w.battery.wibox)
   bottom_layout:add(w.spacer)
   bottom_layout:add(w.logout.wibox)

   -- Now bring it all together (with the tasklist in the middle)
   local layout = wibox.layout.align.vertical()
   -- layout:set_top(top_layout)
   layout:set_middle(right_layout)
   layout:set_bottom(bottom_layout)

   wb:set_widget(layout)

   -- Bind to statusbar
   statusbar.wibox = wb
end
