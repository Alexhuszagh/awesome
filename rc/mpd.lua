local awesompd = require('awesompd/awesompd')

musicwidget = awesompd:create() -- Create awesompd widget
musicwidget.font = font -- Set widget font
-- musicwidget.font_color = "#FFFFFF" --Set widget font color
-- musicwidget.background = "#000000" --Set widget background color
musicwidget.scrolling = true -- If true, the text in the widget will be scrolled
musicwidget.output_size = 30 -- Set the size of widget in symbols
musicwidget.update_interval = 10 -- Set the update interval in seconds

-- Set the folder where icons are located (change username to your login name)
musicwidget.path_to_icons = awful.util.getdir('config') .. "/icons"

-- Set the path to the icon to be displayed on the widget itself
-- musicwidget.widget_icon = "/path/to/icon"

-- Set the default music format for Jamendo streams. You can change
-- this option on the fly in awesompd itself.
-- possible formats: awesompd.FORMAT_MP3, awesompd.FORMAT_OGG
musicwidget.jamendo_format = awesompd.FORMAT_MP3

-- Specify the browser you use so awesompd can open links from
-- Jamendo in it.
musicwidget.browser = "firefox"

-- If true, song notifications for Jamendo tracks and local tracks
-- will also contain album cover image.
musicwidget.show_album_cover = true

-- Specify how big in pixels should an album cover be. Maximum value
-- is 100.
musicwidget.album_cover_size = 50

-- This option is necessary if you want the album covers to be shown
-- for your local tracks.
musicwidget.mpd_config = "~/.mpdconf"

-- Specify decorators on the left and the right side of the
-- widget. Or just leave empty strings if you decorate the widget
-- from outside.
musicwidget.ldecorator = " "
musicwidget.rdecorator = " "

-- Set all the servers to work with (here can be any servers you use)
musicwidget.servers = {
   { server = "localhost",
     port = 6600 },
   { server = "192.168.0.72",
     port = 6600 }
}
musicwidget:run() -- After all configuration is done, run the widget
