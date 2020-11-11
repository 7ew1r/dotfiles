function ghqlas
  if test (count $argv) -ne 1
    echo 'argv is empty'
    return 1
  end

  set -l repos $argv

  set -l cmdpre 'git@github-las:'
  ghq get $cmdpre$repos
end
