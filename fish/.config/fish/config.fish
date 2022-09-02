# suppress intro message
set fish_greeting

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

# starship
if type -q starship
  function starship_transient_rprompt_func
    starship module time
  end
  starship init fish | source
  enable_transience
end

# Justworks
source /opt/secrets/current/dev_env_exports.sh
source /opt/dev/dev.fish
