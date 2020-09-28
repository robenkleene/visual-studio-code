#!/usr/bin/env bash

set -e
cd "$(dirname "$0")" || exit 1
source_path=$(pwd -P);

force=false
while getopts ":dh" option; do
  case "$option" in
    d)
      force=false
      ;;
    h)
      echo "Usage: ./install.sh [-hf]"
      exit 0
      ;;
    :)
      echo "Option -$OPTARG requires an argument" >&2
      exit 1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

dry_run=" --dry-run"
if [[ "$force" == "true" ]]; then
  dry_run=""
else
  echo "DRY RUN"
  echo
fi

destination_path="$HOME/Library/Application\ Support/Code\ -\ Insiders/User"
if [ ! -d "$destination_path" ]; then
  echo "$destination_path does not exist" >&2
  exit 1
fi

echo "dry_run = $dry_run"
# git ls-files | rsync -a --verbose${dry_run} --files-from=- --exclude=.gitignore --exclude=sync.sh \
#   "$source_path" "$destination_path"
