#!/usr/bin/env fish

function local

  byobu set -g default-shell '/bin/bash' \; \
  set -g default-command '/bin/bash' \; \
  new-session -n 'Work bash' -s 'bash Shell' '/bin/bash -l -i' \; \
  bind-key z "kill-session -t 'bash Shell'" 

end

local 

exit 0

