#!/bin/bash
for file in *.tsv; do
	if [[ -f "$file" ]]; then
		dirname="${file%.tsv}"
		mkdir -p "$dirname"
		mv "$file" "$dirname/"
	fi
done
