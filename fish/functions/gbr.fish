function gbr
  git checkout (git branch | grep -v '^\\*' | fzf | sed 's/^  //')
end
