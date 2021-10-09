function fzfr -d "FZF"
  set -l result (fzf $argv)

  if test -r $result
    vim $result
  end
end
