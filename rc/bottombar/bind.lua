-- Binds the wibox to the active and inactive slots
function bind(table)
  -- Skip if not bindable
  if table.data == nil
    then return
  elseif table.data.cmd == nil
    then return
  end
  -- Register to vicious
  vicious.register(table.wibox,
  function ()
    id = running(table.data)
    if id == nil then
      table.wibox:set_image(iconDir .. table.data.icon .. ".png")
    else
      table.wibox:set_image(iconDir .. table.data.icon .. "_active.png")
    end
  end, table.data.time)

  findme = table.data.cmd
  firstspace = table.data.cmd:find(" ")
  if firstspace then
    findme = table.data.cmd:sub(0, firstspace-1)
  end
  -- Connect to tooltip
  table.tooltip = {
      text = table.data.description,
      title = table.data.name,
      timeout = 0,
      icon=iconDir .. table.data.icon .. ".png"
  }
  add_hover_tooltip(table)

  -- Connect to a menu
  local quit = awful.util.getdir("config") .. "/sh/quitprocess.sh " .. table.data.cmd
  local kill = awful.util.getdir("config") .. "/sh/killprocess.sh " .. table.data.cmd
  local window = {{ "&Open", table.data.cmd },
                  { "&Quit", quit },
                  { "&Kill", kill }}
  --local mywidgetmenu = awful.menu.new({ items = { {"Window", window} } })
  local mywidgetmenu = awful.menu.new({ items = window })
  table.wibox:buttons(awful.util.table.join(
    awful.button({ }, 1,
      function ()
        run(table.data)
      end,
      function()
        if table.data.tag_number ~= nil then
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[table.data.tag_number]
          if tag then
             awful.tag.viewonly(tag)
          end
        end
      end),
    awful.button({ }, 3, function ()
      awful.menu.toggle(mywidgetmenu)
    end)))
end
