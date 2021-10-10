function mic
  pactl set-source-volume @DEFAULT_SOURCE@ $argv[1]
end
