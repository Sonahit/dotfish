function cpu_fix -d "Change intel cpu balance mode to performance"

  sudo cpupower frequency-set -g performance
  echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
  echo performance | sudo tee /sys/firmware/acpi/platform_profile

end
