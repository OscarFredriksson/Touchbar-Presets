set FanSpeed to do shell script "/usr/local/bin/istats fan speed --value-only"

set Fan1 to  word 1 of FanSpeed

return Fan1 & " rpm"