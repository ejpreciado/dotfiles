parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

gf() {
  grep -rnw $(pwd) -e $@
}

export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1

alias vim=nvim
alias vi=nvim
alias rc="rails c"
alias rr="rails s -b 'ssl://localhost:3000?key=./localhost.key&cert=./localhost.crt'"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
