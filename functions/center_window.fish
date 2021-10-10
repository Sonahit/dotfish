function __get_monitors
  xrandr --screen 0 | grep -e "\bconnected" | awk '{
  if ($3 == "primary")
    printf "%s %s\n", $3, $4
  else
    printf "%s %s\n", NR, $3
  }' | sort -n
end

function __parse_monitor
  set -l geometry (string split "+" $argv[1])
  set -l monitor_size (string split " " $geometry[1])
  set -l size (string split "x" $monitor_size[2])
  set -l x_offset $geometry[2]
  set -l y_offset $geometry[3]
  set -l x_size $size[1]
  set -l y_size $size[2]

  set -l x_start $x_offset
  set -l x_end (math "$x_start + $x_size")

  set -l y_start $y_offset
  set -l y_end (math "$y_start + $y_size")

  echo "$x_start $x_end $y_start $y_end"

end


function center_window
  set -g window_id $argv[1]
  set -l raw_mouse_location (xdotool getmouselocation)
  set -l mouse_location (string split " " $raw_mouse_location)

  #If no window_id is provided get active id by mouse_location
  if test -z $window_id
    set window_id (string split ":" $mouse_location[4])[2]
  end

  set -l mp_x (string split ":" $mouse_location[1])[2]
  set -l mp_y (string split ":" $mouse_location[2])[2]

  set -l monitors (__get_monitors)

  set -g current_monitor ""

  for monitor in $monitors
    set -l geometry (string split " " (__parse_monitor $monitor))

    set -l x_start $geometry[1]
    set -l x_end $geometry[2]

    set -l y_start $geometry[3]
    set -l y_end $geometry[4]

    if test \( $mp_x -ge $x_start -a $mp_x -le $x_end \) -a \
      \( $mp_y -ge $y_start -a $mp_y -le $y_end \)
      set -g current_monitor $monitor
    end
  end

  if test -z $current_monitor
    echo "Couldn't find monitor"
    return 1
  end

  set -l geometry (string split " " (__parse_monitor $current_monitor))
  set -l x_start $geometry[1]
  set -l x_end $geometry[2]

  set -l y_start $geometry[3]
  set -l y_end $geometry[4]
  #We assume shape is square

  set -l x_center (math "$x_end / 2")
  set -l y_center (math "$y_end / 2")

  set -g is_full_screen 0

  set -l window_stats (xdotool getwindowgeometry --shell $window_id)

  function split_eq
    set -l result (string split "=" $argv)
    echo $result[2]
  end


  set -l window_geometry (split_eq $window_stats[2]) \
    (split_eq $window_stats[3]) \
    (split_eq $window_stats[4]) \
    (split_eq $window_stats[5])

  set -l win_x $window_geometry[1]
  set -l win_y $window_geometry[2]
  set -l win_width $window_geometry[3]
  set -l win_height $window_geometry[4]

  if ! test \( $win_x -ge $x_start -a $win_x -le $x_end \) -a \
    \( $win_y -ge $y_start -a $win_y -le $y_end \)
    set -g is_full_screen 1
  end

  if test $is_full_screen -eq 1
    return 0
  end

  set -l actual_center_x (math "($x_end - $win_width) / 2")
  set -l actual_center_y (math "($y_end - $win_height) / 2")

  xdotool windowmove $window_id $actual_center_x $actual_center_y

end

