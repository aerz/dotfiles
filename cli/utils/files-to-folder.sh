#!/usr/bin/env bash

set -e

folderPath="$(pwd)"

foldersFromFiles=$(
  ls -1p "$folderPath" | # show folders and files line by line
  sed -E '/(.*)\//d' | # get only the files in the folder
  cut -f 1 -d '.' | # remove file extensions
  uniq # filter only the same name one time
)

while IFS= read -r name
do
  echo "Creating folder ${name}..."
  mkdir "$name"

  echo "Moving files..."
  mv -v "$folderPath"/"$name".* "$folderPath"/"$name"/
  echo "OK"
  echo
done < <(printf '%s\n' "$foldersFromFiles")
