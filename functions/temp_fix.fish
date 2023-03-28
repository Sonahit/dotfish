function temp_fix
  sudo thermald --ignore-cpuid-check --workaround-enabled --adaptive --no-daemon
end
