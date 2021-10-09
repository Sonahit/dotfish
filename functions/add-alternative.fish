
function add-alternative
  if ! test -x (which alternatives)
    echo "Package 'alternatives' is not installed!"
    return 1
  end


  argparse "h/help" -- $argv

  if test (count $_flag_help) -ne 0
    echo "creates new alternative in bin folder
  usage:
  add-alternative <main_name> <slave_link> [folder]
"
    return 0
  end

  set -l main_name $argv[1]
  set -l slave_link $argv[2]
  set -q folder $argv[3]; or set -l folder "/usr/local/bin"

  if test -z "$main_name" -o -z "$slave_link"
    echo "name '$main_name' or slave_link '$slave_link' are missing"
    return 1
  end

  set -l priority (math (alternatives --display $main_name | grep priority | wc -l))

  set -l trimmed (string trim -r -c '/' -- $folder)
  set -l main_link $trimmed"/"$main_name
  set -l command "alternatives --install $main_link $main_name $slave_link $priority"

  if fish_is_root_user
    eval $command
  else
    eval "sudo $command"
  end
end
