-- {{{ System Utilities

globalkeys = awful.util.table.join(globalkeys,
  -- Volume
  awful.key({ }, "XF86AudioLowerVolume",
    function()
      awful.util.spawn("amixer -D pulse sset Master 5%-")
    end),
  awful.key({ }, "XF86AudioRaiseVolume",
    function()
      awful.util.spawn("amixer -D pulse sset Master 5%+")
    end),
  awful.key({ }, "XF86AudioMute",
    function()
      awful.util.spawn("amixer -D pulse sset Master toggle")
    end),

  -- Configure Play/Pause to MPD/Spotify/Clementine
  awful.key({ }, "XF86AudioPlay",
   function()
    awful.util.spawn_with_shell(
       "if pgrep mpd >/dev/null; \
          then ncmpcpp toggle; \
       elif pgrep spotify >/dev/null; \
          then dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause; \
       elif pgrep clementine >/dev/null; \
          then clementine -t; \
       fi")
    end),
  awful.key({ }, "XF86AudioPause",
   function()
    awful.util.spawn_with_shell(
       "if pgrep mpd >/dev/null; \
          then ncmpcpp toggle; \
        elif pgrep spotify >/dev/null; \
          then dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause; \
       elif pgrep clementine >/dev/null; \
          then clementine -t; fi")
    end),

  -- Brightness
  awful.key({ }, "XF86MonBrightnessDown",
    function ()
      awful.util.spawn("xbacklight -dec 15")
    end),
  awful.key({ }, "XF86MonBrightnessUp",
    function ()
      awful.util.spawn("xbacklight -inc 15")
    end),

  -- Bind PrintScrn to capture a screen
  awful.key({                   }, "Print",
    function()
      awful.util.spawn( "gnome-screenshot" , false )
    end)
)

-- }}}
