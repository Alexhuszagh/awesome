-- {{{ Signals

-- Connect signal
function connect(wb, data)
  -- Connect enter to make tooltip
  wb:connect_signal("mouse::enter",
     function(c)
        if wb.hover_notification == nil  then
          local nt = data
          nt.screen = mouse.screen
          position = mouse.coords()
          -- underflow
          local char_count = char_count(data['text'], "\n")
          char_count = math.max(char_count-2, 1)
          position['y'] = position['y'] - (10*char_count)
          if position['x'] <= 50 then
            nt.position = "bottom_left"
            wb.hover_notification = naughty.notify(nt)
           -- greater than screen width
          elseif position['x'] + 200 > 1900 then
            nt.position = "bottom_right"
            wb.hover_notification = naughty.notify(nt)
          else
            nt.position = "bottom_right"
            nt.position_exact = position
            wb.hover_notification = naughty_offset.notify(nt)
          end
       end
     end)
  -- Connect leave event to destroy tooltip
  wb:connect_signal("mouse::leave",
     function(c)
        if wb.hover_notification ~= nil then
           naughty.destroy(wb.hover_notification)
           wb.hover_notification = nil
        end
     end)
end

-- Disconnect Signal

function disconnect(wb, data)
  -- Disconnect enter to make tooltip
  wb:disconnect_signal("mouse::enter",
     function(c)
        if wb.hover_notification == nil  then
          local nt = data
          nt.screen = mouse.screen
          position = mouse.coords()
          -- underflow
          local char_count = char_count(data['text'], "\n")
          char_count = math.max(char_count-2, 1)
          position['y'] = position['y'] - (10*char_count)
          if position['x'] <= 50 then
            nt.position = "bottom_left"
            wb.hover_notification = naughty.notify(nt)
           -- greater than screen width
          elseif position['x'] + 200 > 1900 then
            nt.position = "bottom_right"
            wb.hover_notification = naughty.notify(nt)
          else
            nt.position = "bottom_right"
            nt.position_exact = position
            wb.hover_notification = naughty_offset.notify(nt)
          end
       end
     end)
  -- Disconnect leave event to destroy tooltip
  wb:disconnect_signal("mouse::leave",
     function(c)
        if wb.hover_notification ~= nil then
           naughty.destroy(wb.hover_notification)
           wb.hover_notification = nil
        end
     end)
end

-- }}}
