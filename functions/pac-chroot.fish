function pac-chroot
    sudo pacman --root $argv[1] --cachedir $argv[1] $argv[2..]
end
