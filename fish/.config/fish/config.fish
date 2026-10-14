if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_config theme choose catppuccin-macchiato --color-theme=dark
starship init fish | source

# Aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='eza --icons=always --color=auto'
alias ll='eza -a -F -l --icons=always --color=always'
alias la='eza -A --icons=always --color=always'
alias l='eza -F --icons=always --color=always'
alias lsa='eza -l -h -a --icons=always --color=always'

fish_add_path -m ~/bin
fish_add_path -m ~/.local/bin

fzf --fish | source
source $HOME/.git_checkouts/catppuccin-fzf/themes/catppuccin-fzf-mocha.sh

# direnv hook fish | source

# Added by LM Studio CLI (lms)
# set -gx PATH $PATH /home/vmartell/.lmstudio/bin
# End of LM Studio CLI section
