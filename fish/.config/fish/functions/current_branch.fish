function current_branch --description 'prints current git branch name'
  git symbolic-ref --short HEAD
end
