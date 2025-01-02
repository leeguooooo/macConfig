
# function pfd
#   set result (begin; osascript <<EOF
#   tell application "Finder"
#     return POSIX path of (target of window 1 as alias)
#   end tell
# EOF
#   end 2> /dev/null)
#   echo $result
# end


function cdf
  cd (pfd)
end

function touch
  mkdir -p (dirname $argv[1]) ; and touch $argv[1]
end

function take
  mkdir -p (dirname $argv[1]) ; and touch $argv[1] ; and cd (dirname $argv[1])
end

