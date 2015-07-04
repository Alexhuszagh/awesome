
-- Init table with private settings
private = {}

-- Set battery for vicious.widgets.bat
private.battery = "BAT0"
-- Set location 4Digit code from
-- "http://weather.noaa.gov/pub/data/observations/metar/decoded/" .. code .. ".TXT"
private.location = "KSNA"

-- Set audio codec (pulse or alsa)
private.audio = "pulse"

-- Process configs

if private.audio == "pulse" then
  audio = vicious.contrib.pulse
elseif private.audio == "alsa" then
  audio = vicious.widgets.volume
end
