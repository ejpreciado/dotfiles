function gpp --description 'alias gpp git pull; and git push --force-with-lease'
  git pull; and git push --force-with-lease $argv;
end
