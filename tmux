# By Tyler Mulligan. Public domain.
#
# This configuration file binds many of the common GNU screen key bindings to
# appropriate tmux key bindings. Note that for some key bindings there is no
# tmux analogue and also that this set omits binding some commands available in
# tmux but not in screen.
#
# Note this is a good starting point but you should check out the man page for more
# configuration options if you really want to get more out of tmux
 
### Unbind existing tmux key bindings (except 0-9).
 
# Set the prefix to ^A.
unbind C-b
set -g prefix ^A
bind a send-prefix
 
# Bind appropriate commands similar to screen.
# lockscreen ^X x
unbind ^X
bind ^X lock-server
unbind x
bind x lock-server
 
# screen ^C c
unbind ^C
bind ^C new-window
bind c new-window
 
# detach ^D d
unbind ^D
bind ^D detach
 
# displays *
unbind *
bind * list-clients
 
# next ^@ ^N sp n
unbind ^@
bind ^@ next-window
unbind ^N
bind ^N next-window
unbind " "
bind " " next-window
unbind n
bind n next-window
 
# title A
unbind A
bind A command-prompt "rename-window %%"
 
# other ^A
unbind ^A
bind ^A last-window
 
# prev ^H ^P p ^?
unbind ^H
bind ^H previous-window
unbind ^P
bind ^P previous-window
unbind p
bind p previous-window
unbind BSpace
bind BSpace previous-window
 
# windows ^W w
unbind ^W
bind ^W list-windows
unbind w
bind w list-windows
 
# quit \
unbind \
bind \ confirm-before "kill-server"
 
# kill K k
unbind K
bind K confirm-before "kill-window"
unbind k
bind k confirm-before "kill-window"
 
# redisplay ^L l
unbind ^L
bind ^L refresh-client
unbind l
bind l refresh-client
 
# More straight forward key bindings for splitting
unbind %
bind | split-window -h
bind v split-window -h
unbind '"'
bind - split-window -v
bind h split-window -v
 
# History
set -g history-limit 1000
 
 
# Terminal emulator window title
set -g set-titles on
set -g set-titles-string '#S:#I.#P #W'
 
# Status Bar
set -g status-bg black
set -g status-fg white
set -g status-interval 1
set -g status-left '#[fg=green]#H#[default]'
set -g status-right '#[fg=yellow]#(cut -d " " -f 1-4 /proc/loadavg)#[default] #[fg=cyan,bold]%Y-%m-%d %H:%M:%S#[default]'
 
# Notifying if other windows has activities
setw -g monitor-activity on
set -g visual-activity on
 
# Highlighting the active window in status bar
setw -g window-status-current-bg red
 
# Clock
setw -g clock-mode-colour green
setw -g clock-mode-style 24
 
# " windowlist -b
unbind '"'
bind '"' choose-window

#### COLOUR (Solarized dark)

# default statusbar colors
set-option -g status-bg black #base02
set-option -g status-fg yellow #yellow
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg brightblue #base0
set-window-option -g window-status-bg default
#set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-fg brightred #orange
set-window-option -g window-status-current-bg default
#set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg black #base02
set-option -g pane-active-border-fg brightgreen #base01

# message text
set-option -g message-bg black #base02
set-option -g message-fg brightred #orange

# pane number display
set-option -g display-panes-active-colour blue #blue
set-option -g display-panes-colour brightred #orange

# clock
set-window-option -g clock-mode-colour green #green

