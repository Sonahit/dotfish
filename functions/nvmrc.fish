function nvmrc
  set -l current_wd $argv[1]
  if test "$current_wd" = ""
    set current_wd (pwd)
  end

  set -l nvmrc_path "$current_wd/.nvmrc"
  set -l node_version (nvm version)

  if test -e "$nvmrc_path"
    set -l nvmrc_node_version (cat "$nvmrc_path")
    if test "$nvmrc_node_version" = "N/A"
      nvm install $nvmrc_node_version
    end
    if test "$node_version" != "$nvmrc_node_version"
      nvm use $nvmrc_node_version
    end
  else
    nvm use default
  end
end

