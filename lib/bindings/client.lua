-- {{{ Specific Client Keys

clientkeys = awful.util.table.join(clientkeys,
  -- Default settings
  awful.key({ modkey,           }, "f",
    function (c)
      c.fullscreen = not c.fullscreen
    end),
  awful.key({ modkey, "Shift"   }, "c",
    function (c)
      c:kill()
    end),
  awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle),
  awful.key({ modkey, "Control" }, "Return",
    function (c)
      c:swap(awful.client.getmaster())
    end),
  awful.key({ modkey,           }, "o",      awful.client.movetoscreen),
  awful.key({ modkey,           }, "t",
    function (c)
      c.ontop = not c.ontop
    end),
  awful.key({ modkey,           }, "n",
    function (c)
      c.minimized = not c.minimized
    end),

  -- User keys
  awful.key({ modkey,           }, "m",
    function (c)
      c.maximized_horizontal = not c.maximized_horizontal
      c.maximized_vertical   = not c.maximized_vertical
    end),
  awful.key({ modkey,           }, "j",
    function ()
      awful.client.focus.byidx( 1)
      -- Set autofocus off for dock
      if awful.client.type == "dock" then
        awful.client.focus.byidx(1)
      end
      if client.focus then client.focus:raise() end
    end),
  awful.key({ modkey,           }, "k",
    function ()
      awful.client.focus.byidx(-1)
      -- Set autofocus off for dock
      if awful.client.type == "dock" then
        awful.client.focus.byidx(-1)
      end
      if client.focus then client.focus:raise() end
    end),
  awful.key({ modkey,           }, "w",
    function ()
      awful.menu.toggle(mymainmenu)
    end),

  -- Layout manipulation
  awful.key({ modkey, "Shift"   }, "j",
    function ()
      awful.client.swap.byidx(  1)
      -- Set autofocus off for dock
      if awful.client.type == "dock" then
        awful.client.focus.byidx(1)
      end
    end),
  awful.key({ modkey, "Shift"   }, "k",
    function ()
      awful.client.swap.byidx( -1)
      -- Set autofocus off for dock
      if awful.client.type == "dock" then
        awful.client.focus.byidx(-1)
      end
    end),

  -- Window Movement
  awful.key({ modkey,           }, "Up",
    function ()
      awful.client.incwfact( 0.05)
    end),
  awful.key({ modkey,           }, "Down",
    function ()
      awful.client.incwfact(-0.05)
    end),

  -- Tab
  awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
  awful.key({ modkey,           }, "Tab",
    function ()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end)
)

-- }}}
