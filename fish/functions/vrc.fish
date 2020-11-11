function vrc
  set -l workDir /mnt/d/repos

  if not test -d $workDir
    echo "/mnt/d/repos がありません"
    return 1 
  end

  cd (ls -d /mnt/d/repos/*/ | peco)
end
