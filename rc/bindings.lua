-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            -- Set autofocus off for dock
            if awful.client.instance == "cairo-dock" then
              awful.client.focus.byidx(1)
            end
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            -- Set autofocus off for dock
            if awful.client.instance == "cairo-dock" then
              awful.client.focus.byidx(-1)
            end
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j",
         function ()
             awful.client.swap.byidx(  1)
             -- Set autofocus off for dock
            if awful.client.instance == "cairo-dock" then
              awful.client.focus.byidx(1)
            end
         end),
    awful.key({ modkey, "Shift"   }, "k",
         function ()
             awful.client.swap.byidx( -1)
             -- Set autofocus off for dock
            if awful.client.instance == "cairo-dock" then
              awful.client.focus.byidx(-1)
            end
         end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey,           }, "Up",     function () awful.client.incwfact( 0.05)    end),
    awful.key({ modkey,           }, "Down",     function () awful.client.incwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    -- Volume
    awful.key({ }, "XF86AudioLowerVolume", function() awful.util.spawn("amixer -D pulse sset Master 5%-") end),
    awful.key({ }, "XF86AudioRaiseVolume", function() awful.util.spawn("amixer -D pulse sset Master 5%+") end),
    awful.key({ }, "XF86AudioMute", function() awful.util.spawn("amixer -D pulse sset Master toggle") end),

    -- Configure Play/Pause to Spotify/Clementine
    awful.key({ }, "XF86AudioPlay",
       function()
          awful.util.spawn_with_shell(
             "if pgrep spotify >/dev/null; \
                then dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause; \
             elif pgrep clementine >/dev/null; \
                then clementine -t; fi")
        end),
    awful.key({ }, "XF86AudioPause",
       function()
          awful.util.spawn_with_shell(
             "if pgrep spotify >/dev/null; \
                then dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause; \
             elif pgrep clementine >/dev/null; \
                then clementine -t; fi")
        end),
    -- Brightness

    awful.key({ }, "XF86MonBrightnessDown", function ()
        awful.util.spawn("xbacklight -dec 15") end),
    awful.key({ }, "XF86MonBrightnessUp", function ()
        awful.util.spawn("xbacklight -inc 15") end),

    -- Prompt
   --  awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    -- Custom Programs
    -- ncmpcpp
    awful.key({ modkey,"Shift"    }, "n",
      spawn_cmd["ncmpcpp"],
      function()
        -- View tag only.
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[4]
          if tag then
             awful.tag.viewonly(tag)
          end
        end),

    -- Alarm Clock
    awful.key({ modkey,"Shift"    }, "a",
        function ()
          awful.util.spawn("alarm-clock-applet")
        end,
        function()
        -- View tag only.
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[9]
          if tag then
             awful.tag.viewonly(tag)
          end
        end),

    -- Thunderbird
    awful.key({ modkey,"Shift"    }, "t",
        function ()
          awful.util.spawn("thunderbird")
        end,
        function()
        -- View tag only.
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[9]
          if tag then
             awful.tag.viewonly(tag)
          end
        end),

    -- VMWARE
    awful.key({ modkey,"Shift"    }, "v",
        function ()
          awful.util.spawn("vmware")
        end,
        function()
        -- View tag only.
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[7]
          if tag then
             awful.tag.viewonly(tag)
          end
        end),

    -- Sublime Text
    awful.key({ modkey,"Shift"    }, "s",
        function ()
          awful.util.spawn("sublime-text")
        end,
        function()
        -- View tag only.
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[1]
          if tag then
             awful.tag.viewonly(tag)
          end
        end),

    -- Chromium
    awful.key({ modkey,"Shift"    }, "g",
        function ()
          awful.util.spawn("chromium-browser")
        end,
        function()
        -- View tag only.
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[3]
          if tag then
             awful.tag.viewonly(tag)
          end
        end),

    -- Alarm Clock
    awful.key({ modkey,"Shift"    }, "i",
        function ()
          awful.util.spawn("~/icecat/icecat")
        end,
        function()
        -- View tag only.
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[9]
          if tag then
             awful.tag.viewonly(tag)
          end
        end),

    -- App Launcher
    awful.key({ modkey }, "r", function ()
        awful.util.spawn("dmenu_run") end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
    -- Menubar
)
