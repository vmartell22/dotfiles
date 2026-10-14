#!/bin/bash

vagrant(){

  byobu new-session -A -s 'VAGRANT CONSOLE' -t VAGRANT-CONSOLE -c '/Users/vmartell/Learn/VagrantCluster' \; \
  rename-window -t 0 'CONSOLE' \; \
  new-session -d -A -s 'VAGRANT HOSTS' -t VAGRANT-HOSTS -c '/Users/vmartell/Learn/VagrantCluster' \; \
  rename-window -t 0 'HOSTS' \; \
  switch -t 'VAGRANT CONSOLE' \; \
  bind-key v command-prompt -p "Guest Name: " "new-window -c '/Users/vmartell/Learn/VagrantCluster' -n '%1' vagrant ssh '%1'" \; \
  bind-key z "kill-session -t 'VAGRANT HOSTS'; kill-session -t 'VAGRANT CONSOLE'"
}

vagrant 


