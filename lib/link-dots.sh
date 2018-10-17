#!/bin/bash

echo "Linking dotfiles..."
dotfiles="$HOME/dotfiles/files/.*"

for f in ${dotfiles}; do
  fname=$(basename ${f})
  #echo "$f"
  #echo "$fname"
  if [[ "${fname}" == "." || "${fname}" == ".." ]]; then
    continue;
  fi
  replace=y
  if [[ -e "$HOME/${fname}" ]]; then
    replace=n
    echo -n "$HOME/${fname} already exists. Replace it? [yN]: "
    read -r replace
  fi
  if [[ "${replace}" == "y" ]]; then
    echo "Linking in ${fname} ..."
    ln -fs "$(realpath ${f})" "$HOME/${fname}"
  fi
done
