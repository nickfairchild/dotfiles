#!/usr/bin/env bash

backupdir="$HOME/.dotfiles-backup/$(date "+%Y%m%d%H%M.%S")"

print_success() {
    # Print output in green
    printf "\e[0;32m  [✔] $1\e[0m\n"
}

print_info() {
    # Print output in purple
    printf "\e[0;35m $1\e[0m\n"
}

print_error() {
    # Print output in red
    printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

print_question() {
    # Print output in yellow
    printf "\e[0;33m  [?] $1\e[0m"
}

declare -a FILES_TO_SYMLINK=$(find . -type f -maxdepth 1 -name ".*" | sed -e 's|//|/|' | sed -e 's|./.|.|')

compare_files() {
  if [ -e "$2" ]; then
    # Get checksums of either file
    local file1_sha=$( md5 "$1" )
    local file2_sha=$( md5 "$2" )

    # Compare the checksums
    if [ "$file1_sha" != "$file2_sha" ]; then
        echo "backup"
    else
        echo "same"
    fi
  else
    echo "skip"
  fi
}

backup() {
  local i=""
  local sourceFile=""
  local targetFile=""
  local result=""

  mkdir -p $backupdir

  for i in ${FILES_TO_SYMLINK[@]}; do
    sourceFile="$(pwd)/$i"
    targetFile="$HOME/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

    result=$(compare_files $sourceFile $targetFile)
    if [ $result = "backup" ]; then
      cp -Rf "$HOME/$i" "$backupdir/$i"
      print_success "'$targetFile' backed up to '$backupdir/$i'."
    elif [ $result = "same" ]; then
      print_info "Files '$sourceFile' and '$targetFile' are the same."
    else
      print_error "Skipping '$targetFile' file as does not exist."
    fi
  done
}

link_files() {
  local i=""
  local sourceFile=""
  local targetFile=""

  for i in ${FILES_TO_SYMLINK[@]}; do

    sourceFile="$(pwd)/$i"
    targetFile="$HOME/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

    if [ -e "$targetFile" ]; then
      if [ "$(readlink "$targetFile")" != "$sourceFile" ]; then
        rm -rf "$targetFile"
        ln -svf $sourceFile $targetFile
        print_success "Remove and Link $targetFile → $sourceFile"
      else
        print_error "$targetFile → $sourceFile"
      fi
    else
      ln -svf $sourceFile $targetFile
      print_success "Link $targetFile → $sourceFile"
    fi
  done
}


if [ -d $HOME/.dotfiles ]; then
  pushd $HOME/.dotfiles

  print_info "Updating repo"
  git pull origin master

  print_info "Backup old files"
  backup

  print_info "Install dotfiles"
  link_files
fi

popd
print_info "Done"
# exec $SHELL -l
