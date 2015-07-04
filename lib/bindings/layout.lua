
-- {{{ Layout Manipulation Keys

globalkeys = awful.util.table.join(globalkeys,
  -- Shift focus
  awful.key({ modkey, "Control" }, "j",
    function ()
      awful.screen.focus_relative( 1)
    end),
  awful.key({ modkey, "Control" }, "k",
    function ()
      awful.screen.focus_relative(-1)
    end),

  -- Change Layout Type
  awful.key({ modkey,           }, "space",
    function ()
      awful.layout.inc(layouts,  1)
    end),
  awful.key({ modkey, "Shift"   }, "space",
    function ()
      awful.layout.inc(layouts, -1)
    end)
)

-- }}}
