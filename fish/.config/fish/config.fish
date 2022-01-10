set fish_greeting
set -gx EDITOR nvim
set -gx VOLTA_HOME "$HOME/.volta"

fish_add_path "$VOLTA_HOME/bin"
fish_add_path "/opt/homebrew/bin"

starship init fish | source
