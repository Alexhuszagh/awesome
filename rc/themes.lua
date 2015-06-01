-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
 names  = {
         '☭:Code',
         '⚡:Science',
         '♨:HTTP',
         '☠:Term',
         '☃:Blank',
         '⌥:Media',
         '⌘:VM',
         '✇:Notes',
         '✣:IRC',
           },
 layout = {
      layouts[3],   -- 1:Code
      layouts[7],  -- 2:Science
      layouts[7],  -- 3:Chrome
      layouts[12],  -- 4:HTTP
      layouts[2],   -- 5:Term
      layouts[5],  -- 6:Media
      layouts[7],  -- 7:VM
      layouts[2],   -- 8:Notes
      layouts[10],  -- 9:IRC
          }
       }
  for s = 1, screen.count() do
 -- Each screen has its own tag table.
 tags[s] = awful.tag(tags.names, s, tags.layout)
 end
-- }}}
