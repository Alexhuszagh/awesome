---------------------------
-- Default awesome theme --
---------------------------

theme = {}

-- Todo:  Change the $USER to yourself.
pathToConfig = awful.util.getdir("config") .. "/"
themeDir = pathToConfig .. "theme/"

theme.font          = "sans 8"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#1E2320"
theme.bg_urgent     = "#3F3F3F"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#AAAAAA"
theme.fg_focus      = "#0099CC"
theme.fg_urgent     = "#3F3F3F"

theme.border_width  = 1
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = themeDir .. "icons/square_sel.png"
theme.taglist_squares_unsel = themeDir .. "icons/square_unsel.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
theme.menu_height = 30
theme.menu_width  = 200

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"

-- Dark moon background
theme.wallpaper = themeDir .. "darkmoon.jpg"

-- Hill with horses background
-- theme.wallpaper =  themeDir .. "default.jpg"

-- Alpine background
-- theme.wallpaper =  themeDir .. "alpine_wallpaper.jpg"

-- Design white background
-- theme.wallpaper = themeDir .. "design_white.jpg"

-- You can use your own layout icons like this:
-- theme.layout_floating  = themeDir .. "layouts/floating.png"
-- theme.layout_tilebottom = themeDir .. "layouts/tilebottom.png"
-- theme.layout_tileleft   = themeDir .. "layouts/tileleft.png"
-- theme.layout_tile = themeDir .. "layouts/tile.png"
-- theme.layout_tiletop = themeDir .. "layouts/tiletop.png"
theme.layout_fairh = "/usr/share/awesome/themes/default/layouts/fairhw.png"
theme.layout_fairv = "/usr/share/awesome/themes/default/layouts/fairvw.png"
theme.layout_floating  = "/usr/share/awesome/themes/default/layouts/floatingw.png"
theme.layout_magnifier = "/usr/share/awesome/themes/default/layouts/magnifierw.png"
theme.layout_max = "/usr/share/awesome/themes/default/layouts/maxw.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/default/layouts/fullscreenw.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/default/layouts/tilebottomw.png"
theme.layout_tileleft   = "/usr/share/awesome/themes/default/layouts/tileleftw.png"
theme.layout_tile = "/usr/share/awesome/themes/default/layouts/tilew.png"
theme.layout_tiletop = "/usr/share/awesome/themes/default/layouts/tiletopw.png"
theme.layout_spiral  = "/usr/share/awesome/themes/default/layouts/spiralw.png"
theme.layout_dwindle = "/usr/share/awesome/themes/default/layouts/dwindlew.png"


--{{ For the Dark Theme }} --

theme.arr1 = themeDir .. "icons/arr1.png"
theme.arr2 = themeDir .. "icons/arr2.png"
theme.arr3 = themeDir .. "icons/arr3.png"
theme.arr4 = themeDir .. "icons/arr4.png"
theme.arr5 = themeDir .. "icons/arr5.png"
theme.arr6 = themeDir .. "icons/arr6.png"
theme.arr7 = themeDir .. "icons/arr7.png"
theme.arr8 = themeDir .. "icons/arr8.png"
theme.arr9 = themeDir .. "icons/arr9.png"

-- The clock icon:
theme.clock = themeDir .. "icons/myclocknew.png"

--{{ For the wifi widget icons }} --
theme.nethigh = themeDir .. "icons/nethigh.png"
theme.netmedium = themeDir .. "icons/netmedium.png"
theme.netlow = themeDir .. "icons/netlow.png"

--{{ For the battery icon }} --
theme.baticon = themeDir .. "icons/battery.png"

--{{ For the hard drive icon }} --
theme.fsicon = themeDir .. "icons/hdd.png"

--{{ For the volume icons }} --
theme.mute = themeDir .. "icons/mute.png"
theme.music = themeDir .. "icons/music.png"

--{{ For the volume icon }} --
theme.mute = themeDir .. "icons/volmute.png"
theme.volhi = themeDir .. "icons/volhi.png"
theme.volmed = themeDir .. "icons/volmed.png"
theme.vollow = themeDir .. "icons/vollow.png"

--{{ For the CPU icon }} --
theme.cpuicon = themeDir .. "icons/cpu.png"

--{{ For the memory icon }} --
theme.mem = themeDir .. "icons/mem.png"

--{{ For the memory icon }} --
theme.mail = themeDir .. "icons/mail.png"
theme.mailopen = themeDir .. "icons/mailopen.png"


-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
