function vrc
  set -l workDir /mnt/d/repos

  if not test -d $workDir
    echo "/mnt/d/repos がありません"
    return 1 
  end

  set -l projectDir (ls -d /mnt/d/repos/* | peco)
  set -l projectDirWin (echo $projectDir | sed -e 's/\/mnt\///g' | sed -e 's/^./\0:/g' | sed -e 's/\//\\\\/g')
  
  # move windows script folder
  cd "/mnt/c/Users/Arito Shiihata/scripts"
  cmd.exe /c "open-unity-project.bat $projectDirWin"

  cd $projectDir
end
