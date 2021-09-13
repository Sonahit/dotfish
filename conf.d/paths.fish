set -x NVM_DIR "$HOME/.nvm"
set -x YARN_DIR "$HOME/.config/yarn/";
set -x USER_BIN "$HOME/bin/"

set -Ua fish_user_paths "$USER_BIN"
set -Ua fish_user_paths "YARN_DIR/global/node_modules/.bin"
