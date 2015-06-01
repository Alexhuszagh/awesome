-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "Restart Awesome", awesome.restart },
   { "Logout", awesome.quit }
}

launchers = {
   { "File Manager", "thunar" },
   { "Thunderbird", "thunderbird" },
   { "Chromium", "chromium-browser" },
   { "Google Chrome", "google-chrome" },
   { "Firefox", "firefox" },
   --{ "VMWare Player", "vmplayer" },
   { "WMWare Workstattion", "vmware" },
   { "Notes", "xpad" },
   { "Empathy", "empathy" },
   { "Skype", "skype" }

}

scientificSoftware = {
   { "PyMOl", "pymol" },
   { "UCSF Chimera", "chimera" },
   { "VMD", "vmd" },
   { "Matlab", "matlab -desktop" },
   { "xlToolset", "~/Dropbox/xlToolset2/bin/xlToolset.py" }
}

media = {
   { "Spotify", "spotify" },
   { "Clementine", "clementine" },
   { "Kindle", '/usr/share/playonlinux/playonlinux --run "Amazon Kindle"' }
}

coding = {
   { "Geany", "geany" },
   { "LightTable", "/opt/LightTable/LightTable" },
   { "Brackets", "brackets" },
   { "Code::Blocks", "codeblocks" },
   { "Vim", "gvim" },
   { "Sublime", "sublime-text" }
}

utils = {
   { "Screenshot", "gnome-screenshot" },
   { "Frostwire", "frostwire" },
   { "BitTorrent", "transmission-gtk" },
   { "Alarm Clock", "alarm-clock-applet" }
}

logout = {
   { "Reboot", 'reboot'},
   { "Shutdown", 'poweroff'},
}

mymainmenu = awful.menu({ items = { { "Terminal", terminal },
                                    { "Launchers", launchers },
                                    { "Science Software", scientificSoftware },
                                    { "Media", media },
                                    { "Coding", coding },
                                    { "Utilities", utils },
                                    { "Debian", debian.menu.Debian_menu.Debian },
                                    { "Awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "Logout", logout }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}
