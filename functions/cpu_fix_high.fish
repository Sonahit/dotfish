function cpu_fix_high
    echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
    echo 1000000 | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq
    echo 4500000 | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
    echo performance | sudo tee /sys/firmware/acpi/platform_profile
end
