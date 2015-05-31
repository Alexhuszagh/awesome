-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end,
                  -- Function to autofocus upon tab switch
                  function ()
                      awful.client.focus.byidx(0)
                      if client.focus then client.focus:raise() end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end),
        -- Bug Fix, all minimized clients are restored
        awful.key({ modkey, "Shift"   }, "n",
                 function()
                      local tag = awful.tag.selected()
                        for i=1, #tag:clients() do
                            tag:clients()[i].minimized = false
                        end
                 end),
        -- Custom setting to raise cairo-dock
        awful.key({ modkey, "Shift"   }, "m",
         function()
              local all_clients = client.get()
              for i, c in pairs(all_clients) do
                if c.instance == "cairo-dock" then
                    client.focus = c
                    if c:isvisible() then
                      c:lower()
                    else
                      c:raise()
                    end
                end
              end
         end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, function (c)
         c.maximized_horizontal = false
         c.maximized_vertical   = false
         c.maximized            = false
         c.fullscreen           = false
         awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}
