-- {{{ Run only once

-- Uses ps aux | grep to determine if process running
function psaux_grep(cmd)
  isrunning = os.execute("ps aux | grep '" .. cmd .. "$'")
  if isrunning == 0 then
    return true
  else
    return nil
  end
end

-- Uses PGREP to find process ID, nil otherwise
function pgrep(cmd)
  fpid = io.popen("pgrep " .. cmd)
  if fpid ~= nil then
    pid = tonumber(fpid:read("*n"))
  else
    pid = nil
  end
  return pid
end

-- Checks to see if the command is currently running
function running(data)
  if data.grep ~= nil then
    id = psaux_grep(data.grep)
  else
    id = pgrep(data.pgrep)
  end
  return id
end


function run(data)
  id = running(data)
  if id == nil then
    awful.util.spawn_with_shell(data.cmd)
  end
end
-- }}}
