
if status is-interactive
    # Commands to run in interactive sessions can go here

    fish_add_path -m /usr/bin/
    fish_add_path -m /usr/sbin/
    fish_add_path -m /usr/local/bin/
    fish_add_path -m /usr/local/sbin/
    fish_add_path -a "/home/sonahit/bin"
    fish_add_path -a "/home/sonahit/.config/yarn/global/node_modules/.bin"
    set -gx THEME_EDEN_SHOW_HOST yes
    nvm use default --silent
    set -gx fish_color_command white
end

# pnpm
set -gx PNPM_HOME "/home/sonahit/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
#
# set zigup bin
set -gx PATH "$PATH:/home/sonahit/.zigup/bin/"


