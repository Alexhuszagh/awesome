-- {{{ Toggle visibility

function statusbar.show()
  if not statusbar.manual then
    statusbar.wibox.visible = true
  end
end

function statusbar.hide()
  if not statusbar.manual then
    statusbar.wibox.visible = false
  end
end

function statusbar.toggle()
  -- Only change if not manually configured for leave/enter events
  statusbar.wibox.visible = not statusbar.wibox.visible
  statusbar.manual = not statusbar.manual
end
