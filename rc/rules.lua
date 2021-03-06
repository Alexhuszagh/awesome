-- Base params
local screengeom = screen[mouse.screen].workarea
tildawidth  = screengeom.width  * 0.25
tildaheight = screengeom.height * 0.35

-- {{{ Rules

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     size_hints_honor = false,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    -- Secondary global for all but cairo-dock
    { rule = { },
      except = { class = "cairo-dock" } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = false } },
    -- Code Editors
    { rule = { class = "Geany" },
      properties = { tag = tags[screen.count()][1] }, switchtotag=true },
    { rule = { class = "LightTable" },
      properties = { tag = tags[screen.count()][1] }, switchtotag=true },
    { rule = { class = "codeblocks" },
      properties = { tag = tags[screen.count()][1] }, switchtotag=true },
    { rule = { class = "Start here - Code::Blocks 13.12" },
      properties = { tag = tags[screen.count()][1] }, switchtotag=true },
    { rule = { class = "brackets" },
      properties = { tag = tags[screen.count()][1] }, switchtotag=true },
    { rule = { class = "Getting Started - Brackets" },
      properties = { tag = tags[screen.count()][1] }, switchtotag=true },
    { rule = { class = "sublime_text" },
      properties = { tag = tags[screen.count()][1] }, switchtotag=true },
    { rule = { class = "sublime-text-2" },
      properties =  { tag = tags[screen.count()][1] }, switchtotag=true },
    { rule = { class = "sublime-text" },
      properties =  { tag = tags[screen.count()][1] }, switchtotag=true },
    -- Set Scientific Software to screen 2
    { rule = { class = "Chimera" },
      properties = { tag = tags[screen.count()][2] }, switchtotag=true },
    { rule = { class = "MATLAB" },
      properties = { tag = tags[screen.count()][2] }, switchtotag=true },
    { rule = { class = "PyMOL Viewer" },
      properties = { tag = tags[screen.count()][2] }, switchtotag=true },
    { rule = { class = "The PyMOL Molecular Graphics System" },
      properties = { tag = tags[screen.count()][2] }, switchtotag=true },
    { rule = { class = "VMD Main" },
      properties = { tag = tags[screen.count()][2] }, switchtotag=true },
    { rule = { class = "VMD 1.9.2beta1 OpenGL Display" },
      properties = { tag = tags[screen.count()][2] }, switchtotag=true },
    { rule = { class = "VMD" },
      properties = { tag = tags[screen.count()][2] }, switchtotag=true },
    {  rule = { class = "libreoffice" },
      properties = { tag = tags[screen.count()][2] }, switchtotag=true },
    {  rule = { class = "gnumeric" },
      properties = { tag = tags[screen.count()][2] }, switchtotag=true },
    -- Set browsers to map to 3
    { rule = { class = "Firefox" },
      properties = { tag = tags[screen.count()][3] }, switchtotag=true },
    { rule = { class = "Chromium-browser" },
      properties = { tag = tags[screen.count()][3] }, switchtotag=true },
    { rule = { class = "Google-chrome-stable" },
      properties = { tag = tags[screen.count()][3] }, switchtotag=true },
    { rule = { class = "Icecat" },
      properties = { tag = tags[screen.count()][3] }, switchtotag=true },
    -- Set terminal to 4
    { rule = { class = "Gnome-terminal" },
      properties = { tag = tags[screen.count()][4] }, switchtotag=true },
    { rule = { class = "x-terminal-emulator" },
      properties = { tag = tags[screen.count()][4] }, switchtotag=true },
    -- Set file launchers to 5
    { rule = { class = "Thunar" },
      properties = { tag = tags[screen.count()][5] }, switchtotag=true },
    { rule = { class = "Nautilus" },
      properties = { tag = tags[screen.count()][5] }, switchtotag=true },
    -- Set media to 6
    { rule = { class = "Spotify" },
      properties = { tag = tags[screen.count()][6] }, switchtotag=true },
    { rule = { class = "Clementine" },
      properties = { tag = tags[screen.count()][6] }, switchtotag=true },
    { rule = { class = "Wine" },
      properties = { tag = tags[screen.count()][6] }, switchtotag=true },
    { rule = { class = "Kindle.exe" },
      properties = { tag = tags[screen.count()][6] }, switchtotag=true },
    { rule = { class = "Steam" },
      properties = { tag = tags[screen.count()][6] }, switchtotag=true },
    -- Set VMPlayer/VMWare Workstattion and/or OpenBox to 7
    { rule = { class = "Vmplayer" },
      properties = { tag = tags[screen.count()][7] }, switchtotag=true },
    { rule = { class = "Vmware" },
      properties = { tag = tags[screen.count()][7] },
        switchtotag = true,
        floating = true,
       },
    -- Notes to 8
    { rule = { class = "xpad" }, { instance = "xpad" },
      properties = { tag = tags[screen.count()][8] }, switchtotag=true },
    -- Leisure, off-topic to 9
    { rule = { class = "Thunderbird" },
      properties = { tag = tags[screen.count()][9] }, switchtotag=true },
    { rule = { class = "Empathy" },
      properties = { tag = tags[screen.count()][9] }, switchtotag=true },
    { rule = { class = "Skype" },
      properties = { tag = tags[screen.count()][9] }, switchtotag=true },
    { rule = { class = "alarm-clock-applet" },
      properties = { tag = tags[screen.count()][9] }, switchtotag=true },
    { rule = { name = "Alarms" },
      properties = { tag = tags[screen.count()][9] }, switchtotag=true },
    -- Set file launchers to 5
    { rule = { class = "Pidgin" },
      properties = { tag = tags[screen.count()][9] }, switchtotag=true },
    { rule = { class = "empathy" },
      properties = { tag = tags[screen.count()][9] }, switchtotag=true },
    { rule = { class = "Conky" },
      properties = {
        --floating = true,
        -- Need to disable borders
        border_width = 0,
        sticky = true,
        ontop = false,
        below = true,
        focus = false,
        focusable = false,
        size_hints = {"program_position", "program_size"},
        callback = awful.client.setslave
      }
    },
    -- Dropdown, floating terminal
    { rule = { class = "Tilda" },
      properties = {
        floating = true,
        -- Need to disable borders
        border_width = 10,
        border_color = "#92B0A0",
        ontop = true,
        above = true,
        geometry = { width = tildawidth,
                     height = tildaheight }
        -- callback = function(c)
        --   local geometry = c:geometry()
        --   c:geometry( { x = geometry.x, y = geometry.y } )
        -- end
      }
    },
    -- Dropdown, non-floating terminal
    { rule = { instance = "urxvt" },
      properties = {
        floating = false,
        -- Need to disable borders
        border_width = 10,
        border_color = "#92B0A0",
        ontop = true,
        above = true
      }
    }
}

-- }}}
