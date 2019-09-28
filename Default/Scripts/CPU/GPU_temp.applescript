
set temp to do shell script "/usr/local/bin/istats scan TCGC --value-only | awk '{print int($1+0.5)}'"
set value to do shell script "sed s/[a-zA-Z:{},]//g <<< " & temp

set value to value & "¡C"

return value