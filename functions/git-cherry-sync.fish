function git-cherry-sync
  set -l source $argv[1]
  set -l target $argv[2]
  set -l target_source $argv[3]

  git branch 2>&1 > /dev/null

  if test $status -ne 0
    echo "git is not initialized"
    return $status;
  end

  git checkout -b $target $target_source

  git cherry-pick $source

  git push -u origin $target
end
