----{{--| Volume / volume icon |----------

volume = { wibox = wibox.widget.textbox(),
           text = '',
           icon = wibox.widget.imagebox() }
vicious.register(volume.wibox, audio, function (widget, args)

    if args[1] ~= nil then
      volume.text = '<span background="#4B3B51" font="Inconsolata 11"><span font="Inconsolata 11" color="#EEEEEE"> Vol: '..math.floor(args[1])..' </span></span>'
    end
    return volume.text
  end, 2, "alsa_output.pci-0000_00_1b.0.analog-stereo")

volume.wibox:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn("amixer -D pulse sset Master toggle", false) end),
    awful.button({ }, 3, function () run_in_terminal("alsamixer") end),
    awful.button({ }, 4, function () awful.util.spawn("amixer -D pulse sset Master 5%+", false) end),
    awful.button({ }, 5, function () awful.util.spawn("amixer -D pulse sset Master 5%-", false) end)
))

vicious.register(volume.icon, audio, function (widget, args)
    local paraone = tonumber(args[1])

    -- Don't change image if nil returned
    if args[2] == nil or paraone == nil then
        do end
    elseif args[2] == "♩" or paraone == 0 then
        volume.icon:set_image(beautiful.mute)
    elseif paraone >= 67 and paraone <= 100 then
        volume.icon:set_image(beautiful.volhi)
    elseif paraone >= 33 and paraone <= 66 then
        volume.icon:set_image(beautiful.volmed)
    else
        volume.icon:set_image(beautiful.vollow)
    end

end, 0.3, "alsa_output.pci-0000_00_1b.0.analog-stereo")
