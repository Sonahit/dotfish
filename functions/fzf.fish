function fzf
  set -l FZF_DEFAULT_COMMAND "find $PWD -type f"
  set -l FZF_DEFAULT_OPTS "--layout=reverse --inline-info"
  set -l fzf (which fzf)

  set -l result ($fzf $argv -i --preview='cat -n {}')

  echo $result
end
