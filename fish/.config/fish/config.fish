# suppress intro message
set fish_greeting

# i love neovim
set -gx EDITOR nvim
set -Ux MANPAGER 'nvim +Man!'

# homebrew
fish_add_path /opt/homebrew/sbin

# volta
if test -d $HOME/.volta
  set -gx VOLTA_HOME "$HOME/.volta"
  fish_add_path "$VOLTA_HOME/bin"
end

# frum
if test -d $HOME/.frum
  frum init | source
end

# cargo
if test -d $HOME/.cargo/bin
  fish_add_path "$HOME/.cargo/bin"
end

# starship
if type -q starship
  starship init fish | source
end
