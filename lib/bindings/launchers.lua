
-- {{{ Keys for Program Launchers

globalkeys = awful.util.table.join(globalkeys,
  -- Prompt
  awful.key({ modkey, "Shift"   },        "r",
    function ()
      mypromptbox[mouse.screen]:run()
    end),

  -- App Launcher
  awful.key({ modkey            }, "r",
    function ()
      awful.util.spawn("dmenu_run")
    end),

  awful.key({ modkey            }, "x",
    function ()
      awful.prompt.run({ prompt = "Run Lua code: " },
      mypromptbox[mouse.screen].widget,
      awful.util.eval, nil,
      awful.util.getdir("cache") .. "/history_eval")
    end),

  -- Terminals
  awful.key({ modkey,           }, "`",
    function ()
      awful.util.spawn("tdrop -W urxvt")
    end),

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
  awful.key({ modkey, "Shift"    }, "s",
    function ()
      awful.util.spawn("subl")
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
  awful.key({ modkey, "Shift"    }, "g",
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
  awful.key({ modkey, "Shift"    }, "i",
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
    end)
)

-- Make urxvt dropdown 1-12
for number = 1, 12, 1
  do
    globalkeys = awful.util.table.join(globalkeys,
      awful.key({ modkey,           }, "F" .. number,
        function ()
          awful.util.spawn("tdrop -n" .. number .. " -W urxvt")
        end)
    )
end

-- }}}
