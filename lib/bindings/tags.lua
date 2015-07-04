-- {{{ Tag Keys

globalkeys = awful.util.table.join(globalkeys,
  awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
  awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
  awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
  awful.key({ modkey,           }, "l",
    function ()
      awful.tag.incmwfact( 0.05)
    end),
  awful.key({ modkey,           }, "h",
    function ()
      awful.tag.incmwfact(-0.05)
    end),
  awful.key({ modkey, "Shift"   }, "h",
    function ()
      awful.tag.incnmaster( 1)
  end),
  awful.key({ modkey, "Shift"   }, "l",
    function ()
      awful.tag.incnmaster(-1)
  end),
  awful.key({ modkey, "Control" }, "h",
    function ()
      awful.tag.incncol( 1)
  end),
  awful.key({ modkey, "Control" }, "l",
    function ()
      awful.tag.incncol(-1)
  end)
)

-- }}}
