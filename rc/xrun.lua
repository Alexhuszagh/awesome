-- {{{ Run program once
function processwalker()
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

function run_once(process, cmd, shell)
   assert(type(process) == "string")
   local regex_killer = {
      ["+"]  = "%+", ["-"] = "%-",
      ["*"]  = "%*", ["?"]  = "%?" }

   for p in processwalker() do
      if p:find(process:gsub("[-+?*]", regex_killer)) then
   return
      end
   end
   if shell then
     return awful.util.spawn_with_shell(cmd or process)
   else
     return awful.util.spawn(cmd or process)
   end
end
-- }}}

-- {{ I need redshift to save my eyes }} -
run_once("redshift -l 49.26:-123.23")
-- Start user applets
run_once("nm-applet")
awful.util.spawn_with_shell("xmodmap ~/.speedswapper")
-- Start gnome authentification
run_once("dbus-launch --exit-with-session $session_command")
run_once("polkit-gnome-authentication-agent-1")
run_once("/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1")
-- run_once("openvpn", "gksudo openvpn home/alex/vpn/TCP/USA.Texas.Dallas_LOC2S4.TCP.ovpn")
-- Start MPD & ncmpcpp
run_once("mpd")
-- Start Tilda, Drop down term
run_once("tilda", "sleep 0.1; tilda -c ncmpcpp & sleep 0.1; tilda -c python & sleep 0.1; tilda -c node & sleep 0.1; tilda &", true)
-- Start Compositor // Switched to Compton for speed + stability
--run_once("xcompmgr", "xcompmgr -CcfF -I-.02 -O-.04 -D0001 -t-5 -l-5 -r4.2 -o.82")
run_once("compton")
-- Start conky last
run_once("conky")

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

do
  local cmds =
  {
    "~/.config/awesome/sh/alarm.sh",
    "/usr/bin/gnome-keyring-daemon --start --components=gpg",
    "/usr/bin/gnome-keyring-daemon --start --components=ssh"
    -- }}

    -- {{ Launch Foreground tasks
  }

  for _,i in pairs(cmds) do
    awful.util.spawn_with_shell(i)
  end
end
