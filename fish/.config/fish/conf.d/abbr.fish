# shell
abbr --add c    'clear'
abbr --add e    'nvim'
abbr --add vim  'nvim'

# pyenv
abbr --add pe   'pyenv'
abbr --add pea  'pyenv activate'
abbr --add ped  'pyenv deactivate'

# git
abbr --add g    'git'

abbr --add ga   'git add'
abbr --add gap  'git add -p'

abbr --add gb   'git branch'
abbr --add gbd  'git branch -D'

abbr --add gc   'git commit --verbose'
abbr --add gca  'git commit -a --verbose'
abbr --add gcam 'git commit -am'
abbr --add gcm  'git commit -m'
abbr --add gm   'git commit --amend --verbose'

abbr --add gco  'git checkout'
abbr --add gco.  'git checkout .'

abbr --add gd   'git diff'
abbr --add gdc  'git diff --cached'
abbr --add gdd  'git diff --color-words'
abbr --add gddc 'git diff --color-words --cached'
abbr --add gds  'git diff --stat'
abbr --add gdsc 'git diff --stat --cached'

abbr --add gwch 'git whatchanged -p --abbrev-commit --pretty=medium'

abbr --add glg  'git log --graph --max-count=10'
abbr --add gls  'git log --stat --max-count=10'
abbr --add gla  'git log --graph --all'

abbr --add gp   'git pull'
abbr --add gpp  'git pull; and git push --force-with-lease'
abbr --add gpu  'git push --force-with-lease'

abbr --add gr   'git restore'
abbr --add grs  'git restore --staged'
abbr --add grs. 'git restore --staged .'

abbr --add grbi 'git rebase -i'
abbr --add grbc 'git rebase --continue'
abbr --add grba 'git rebase --abort'

abbr --add gsta 'git stash'
abbr --add gstv 'git stash save'
abbr --add gsts 'git stash show --text'
abbr --add gstp 'git stash pop'
abbr --add gstd 'git stash drop'
abbr --add gstl 'git stash list'

abbr --add gs   'git status --short'
abbr --add gsw  'git switch'
abbr --add gsw- 'git switch -'
abbr --add gswc 'git switch -c'

abbr --add gtop 'cd (git rev-parse --show-toplevel; or echo ".")'

# Justworks
abbr --add rdb  'DB=remote'
abbr --add be   'bundle exec'
abbr --add berc 'bundle exec rails c'
abbr --add bers 'bundle exec rails s'
abbr --add sdkq 'redis-server --daemonize yes; bundle exec sidekiq'
abbr --add rdfl 'redis-cli flushall'
abbr --add yw   'yarn watch'
abbr --add yb   'yarn build'
