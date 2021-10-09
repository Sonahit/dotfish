function alternatives
  set -l command "alternatives $argv"

  if fish_is_root_user
    eval $command
  else
    eval "sudo $command"
  end
end
