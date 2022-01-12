set fish_greeting
set -gx EDITOR nvim

fish_add_path "/opt/homebrew/bin"

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

curl https://get.volta.sh | bash
