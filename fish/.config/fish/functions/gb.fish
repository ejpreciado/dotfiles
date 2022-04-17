function gb --description 'alias gb git branch --sort=-authordate'
  git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'
end
