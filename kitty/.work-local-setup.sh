#!/bin/bash

local(){

  byobu  new-session -A -c $HOME -s WORK -n WORK \; \
  new-session -A -c /home/vmartell/Learn -s DEVELOPMENT -n DEVELOPMENT \; \
  switch -t WORK \; \
  bind-key c command-prompt -p "Window Name: " "new-window; rename-window '%%'" \; \
  bind-key x kill-server

}

local 

exit 0
