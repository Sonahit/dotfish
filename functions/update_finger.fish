function update_finger
  fprintd-delete "$USER"
  fprintd-enroll
end

