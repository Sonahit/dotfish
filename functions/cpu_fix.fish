function cpu_fix -d "Change intel cpu balance mode to performance"

  sudo cpupower frequency-set -g performance
  echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
  echo 3500000 | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq
  echo 4700000 | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
  echo performance | sudo tee /sys/firmware/acpi/platform_profile

end
