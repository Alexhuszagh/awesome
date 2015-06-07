
-- Initializes the statusbar for enter/exit signals
function statusbar.set_border(s)
  local wb = awful.wibox { position = statusbar.position,
                           screen = s,
                           height = 1,
                           --ontop = true,
                           sticky = true,
                           above = true }
  wb:set_bg("#101010")
  statusbar.bottomborder = wb
end
