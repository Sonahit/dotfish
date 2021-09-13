function __node_binary_path
  nvm which current $argv
end

function __start_node
  __node_binary_path --silent 2&>1 > /dev/null

  if test $status -ne 0
    return 200
  else
    set -l binary (__node_binary_path)
    $binary $argv
  end

end

function node
  __start_node $argv
  if test $status -eq 200
    nvm use default --silent
    __start_node $argv
  end
end

