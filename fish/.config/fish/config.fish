set fish_greeting
set -gx EDITOR nvim

# homebrew
fish_add_path "/usr/local/sbin"

# volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

frum init | source
starship init fish | source
