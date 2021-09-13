if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx THEME_EDEN_SHOW_HOST yes
    nvm use default --silent
    set -gx fish_color_command white
end
