-- load modded awesome configurations
naughty_offset = loadrc("naughty_offset")
loadrc("bottombar/tooltip")
loadrc("bottombar/run")
loadrc("bottombar/bind")

-- {{{ Status Bar

statusbar = { widgets = {},
              position = "bottom",
              manual = false }
local widgets = statusbar.widgets

loadrc("bottombar/toggle")
loadrc("bottombar/signals")
loadrc("bottombar/widgets")
loadrc("bottombar/border")
loadrc("bottombar/create")

-- }}}

for s = 1, screen.count() do
    statusbar.set_border(s)
    statusbar.create(s)
end

-- {{{ Connect Enter/Leave for StatusBar

statusbar.bottomborder:connect_signal("mouse::enter",
  function(c)
    statusbar:show()
  end)

statusbar.wibox:connect_signal("mouse::leave",
  function(c)
    statusbar:hide()
  end)
statusbar:hide()

-- }}}
