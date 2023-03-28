function cpu_fix --description 'Change intel cpu balance mode to performance'

    sudo cpupower frequency-set -g performance
    echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
    echo 1000000 | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq
    echo 4000000 | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
    echo balanced | sudo tee /sys/firmware/acpi/platform_profile

end
