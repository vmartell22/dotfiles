# config.nu
#
# Installed by:
# version = "0.115.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
#

$env.config.buffer_editor = 'helix'

$env.config = {
  # ... your existing configurations ...
  keybindings: [
    {
      name: fzf_history_search
      modifier: control
      keycode: char_r
      mode: [emacs, vi_insert, vi_normal]
      event: [
        {
          send: ExecuteHostCommand
          cmd: "commandline edit --insert (history | each { |it| $it.command } | uniq | reverse | str join (char nl) | fzf --layout=reverse --height=40% | str trim)"
        }
      ]
    }
    {
      name: fzf_directory_and_file_preview
      modifier: control
      keycode: char_t
      mode: [emacs, vi_insert, vi_normal]
      event: [
        {
          send: ExecuteHostCommand
          cmd: "commandline edit --insert (fzf --layout=reverse --height=50% --preview='if [ -d {} ]; then eza --tree --level=2 --icons=auto {}; else bat --color=always --style=numbers {}; fi' | str trim)"
        }
      ]
    }
  ]
}

source ( $nu.home-dir | path join ".git_checkouts/catppuccin-nushell/themes/catppuccin_mocha.nu")
source ( $nu.home-dir | path join ".git_checkouts/catppuccin-fzf/themes/catppuccin-fzf-mocha.nu")

# 1. Shell Hooks & Prompts
source ( $nu.home-dir | path join ".config/nushell/starship.nu")
source ( $nu.home-dir | path join ".config/nushell/zoxide.nu")

# 2. System Path Layer & Binary Mapping
$env.PATH = (
    $env.PATH 
    | split row (char esep)
    | prepend $'($env.HOME)/.cargo/bin' 
    | prepend $'($env.HOME)/.local/bin'
    | prepend $'($env.HOME)/bin'

)

$env.ERL_AFLAGS = "-kernel shell_history enabled"

# 4. Omarchy Quality of Life Quick Aliases
alias c = clear
alias .. = cd ..
alias ... = cd ../..
alias g = git
alias gst = git status
alias gco = git checkout
alias gcm = git commit -m

# 5. Eza Overrides (Omni-Functional File Listings)
# def --wrapped ls [...rest] { eza --icons=auto --group-directories-first ...$rest }
# def --wrapped ll [...rest] { eza -lh --icons=auto --group-directories-first ...$rest }
# def --wrapped la [...rest] { eza -lah --icons=auto --group-directories-first ...$rest }
# def --wrapped lt [...rest] { eza --tree --level=2 --icons=auto ...$rest }

# mise activate nu | save --force ($nu.temp-dir | path join "mise-activate.nu")
# source ($nu.temp-dir | path join "mise-activate.nu")

# Generate/load Carapace's Nushell integration
mkdir ($nu.cache-dir)
carapace _carapace nushell | save -f ($nu.cache-dir | path join "carapace.nu")

source ($nu.cache-dir | path join "carapace.nu")
# carapace _carapace nushell | label | source

# External argument completer
let carapace_completer = {|spans|
    carapace $spans.0 nushell ...$spans | from json
}

$env.config.completions.external.completer = $carapace_completer

