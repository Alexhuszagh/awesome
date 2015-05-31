-- {{{ Run program once
local function processwalker()
   local function yieldprocess()
      for dir in lfs.dir("/proc") do
        -- All directories in /proc containing a number, represent a process
        if tonumber(dir) ~= nil then
          local f, err = io.open("/proc/"..dir.."/cmdline")
          if f then
            local cmdline = f:read("*all")
            f:close()
            if cmdline ~= "" then
              coroutine.yield(cmdline)
            end
          end
        end
      end
    end
    return coroutine.wrap(yieldprocess)
end

local function run_once(process, cmd)
   assert(type(process) == "string")
   local regex_killer = {
      ["+"]  = "%+", ["-"] = "%-",
      ["*"]  = "%*", ["?"]  = "%?" }

   for p in processwalker() do
      if p:find(process:gsub("[-+?*]", regex_killer)) then
   return
      end
   end
   return awful.util.spawn(cmd or process)
end
-- }}}

-- {{ I need redshift to save my eyes }} -
run_once("redshift -l 49.26:-123.23")
-- Start user applets
run_once("clementine")
run_once("nm-applet")
run_once("dropbox", "dropbox start")
awful.util.spawn_with_shell("xmodmap ~/.speedswapper")
-- Start gnome authentification
run_once("sudo polkit-gnome-authentication-agent-1")
run_once("sudo /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1")
-- Start MPD & ncmpcpp
run_once("~/.config/autostart/mpd.desktop")
-- Start Tilda, Drop down term
run_once("tilda")
-- Start Compositor
run_once("xcompmgr", "xcompmgr -CcfF -I-.02 -O-.04 -D0001 -t-5 -l-5 -r4.2 -o.82")

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

do
  local cmds =
  {
    -- {{ Launch background tasks
    "~/.config/awesome/sh/cairo.sh",
    "~/.config/awesome/sh/alarm.sh",
    "~/.config/awesome/sh/conky.sh"
    -- }}

    -- {{ Launch Foreground tasks
  }

  for _,i in pairs(cmds) do
    awful.util.spawn_with_shell(i)
  end
end
