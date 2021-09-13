function node
  set -l binary (nvm which current)
  $binary $argv
end

