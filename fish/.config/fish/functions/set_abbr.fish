function set_abbr --description 'Set abbreviations from conf.d/abbr.fish'
  # Erase all existing abbreviations
  for ab in (abbr --list)
    abbr --erase $ab
  end

  # Source current abbreviations
  set -e fish_abbr_set
  source "$HOME/.config/fish/conf.d/abbr.fish"
end
