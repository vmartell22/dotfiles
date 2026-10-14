#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

unset LS_COLORS
unset EZA_COLORS

if [[ ! $TERM = "linux" ]]; then
  alias ls='eza --icons=always --color=auto'
  alias ll='eza -a -F -l --icons=always --color=always'
  alias la='eza -A --icons=always --color=always'
  alias l='eza -F --icons=always --color=always'
  alias lsa='eza -l -h -a --icons=always --color=always'
fi

source $HOME/.git_checkouts/catppuccin-bash/catppuccin-mocha
eval "$(fzf --bash)"
source $HOME/.git_checkouts/catppuccin-fzf/themes/catppuccin-fzf-mocha.sh
source $HOME/.bash_completion/alacritty

# PS1='[\u@\h \W]\$ '

export PATH="$HOME/.cargo/bin:$PATH"
eval "$(starship init bash)"
