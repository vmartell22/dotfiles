#!/usr/bin/env fish

function vagrant

  byobu new-session -A -s 'VAGRANT CONSOLE' -t VAGRANT-CONSOLE -c '/home/vmartell/Learn/VagrantCluster' \; \
  rename-window -t 'VAGRANT CONSOLE' 'CONSOLE'\; \
  new-session -d -A -s 'VAGRANT HOSTS' -t VAGRANT-HOSTS -c '/home/vmartell/Learn/VagrantCluster' \; \
  rename-window -t 'VAGRANT HOSTS' 'HOSTS' \; \
  switch -t 'VAGRANT CONSOLE' \; \
  bind-key v command-prompt -p "Guest Name: " "new-window -c '/home/vmartell/Learn/VagrantCluster' -n '%1' vagrant ssh '%1'" \; \
  bind-key z "kill-session -t 'VAGRANT HOSTS'; kill-session -t 'VAGRANT CONSOLE'"

end

vagrant 


