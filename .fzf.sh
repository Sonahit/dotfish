/bin/env HOME=/tmp/foo fish -c 'mkdir -p $HOME/.config/fish/functions/
touch $HOME/.config/fish/config.fish

for file in (ls /home/sonahit/.config/fish/functions/fzf*.fish)
  set -l filename (basename $file)
  cp $file "$HOME/.config/fish/functions/$filename"
end
source $HOME/.config/fish/config.fish
fish_title "fzf"
fzfr
'
