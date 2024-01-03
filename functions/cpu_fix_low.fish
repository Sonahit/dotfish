function cpu_fix_low
    echo powersave | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
    echo 400000 | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq
    echo 2000000 | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
    echo low-power | sudo tee /sys/firmware/acpi/platform_profile
end
