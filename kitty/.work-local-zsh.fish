#!/usr/bin/env fish

function local

  byobu set -g default-shell '/bin/zsh' \; \
  set -g default-command '/bin/zsh' \; \
  new-session -n 'Work zsh' -s 'zsh Shell' '/bin/zsh -l -i' \; \
  bind-key z "kill-session -t 'zsh Shell'" 

end

local 

exit 0

