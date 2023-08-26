# suppress intro message
set fish_greeting

# homebrew
fish_add_path /opt/homebrew/bin

# i love neovim
set -gx EDITOR nvim
set -Ux MANPAGER 'nvim +Man!'

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

# pyenv
if test -d $HOME/.pyenv
  set -gx PYENV_VIRTUALENV_DISABLE_PROMPT 1
  status is-login; and pyenv init --path | source
  status is-interactive; and pyenv init - | source
  status is-interactive; and pyenv virtualenv-init - | source
end

# Justworks
if test -e /opt/secrets/current/dev_env_exports.sh
  source /opt/secrets/current/dev_env_exports.sh
end
if test -e /opt/dev/dev.fish
  source /opt/dev/dev.fish
end
