-- load core libraries
local math = require("math")
local capi = { screen = screen,
               awesome = awesome,
               dbus = dbus,
               timer = timer,
               awesome = awesome }

-- {{{ Tooltip

function char_count(str, char)
    if not str then
        return 0
    end

    local count = 0
    local byte_char = string.byte(char)
    for i = 1, #str do
        if string.byte(str, i) == byte_char then
            count = count + 1
        end
    end
    return count
end

-- Adds a hovering tooltip over the widget
function add_hover_tooltip (table)

  -- Bind connects
  connect(table.wibox, table.tooltip)
  -- Die signal for when the tooltip runs out
  if table.timeout ~= nil then
    local timer_die = capi.timer { timeout = table.timeout }
    timer_die:connect_signal("timeout",
      function()
        disconnect(table.wibox, table.tooltip)
      end)
    timer_die:start()
  end
end

-- }}}
