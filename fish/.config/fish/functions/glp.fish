function glp --description 'alias glp git log --pretty'
  git log --pretty=format:"%C(yellow)%h %C(magenta)%ad%C(red)%d %Creset%s%C(blue) [%cn]" --decorate --date=short
end
