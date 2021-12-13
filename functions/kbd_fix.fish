function kbd_fix
  echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode
end
