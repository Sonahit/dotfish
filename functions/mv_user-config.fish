function mv_user-config
    set -l folder $argv[1]

    if ! test -e $folder
        echo "Folder '$folder' doesnt exist"
        return 1
    end

    mv $folder ~/.user-config

    ln -s ~/.user-config/$folder $folder
end
