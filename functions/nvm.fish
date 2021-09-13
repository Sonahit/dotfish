function __nvm_run
  bass source "$NVM_DIR/nvm.sh" --no-use ';' nvm $argv
end

function nvm
  __nvm_run $argv
end


