#!/bin/bash

# Clear README.md
cat /dev/null > README.md

# Add Title
echo -e '# Today I Learned\n' > README.md
echo -e 'This is a collection of short notes of the things I have learned on a daily basis while working on different technologies. I share these notes as I [learn in public](https://www.learninpublic.org/).\n' > README.md

dir=./learnings
til_array=()

# Loop through all TILs and add to README.md
for filename in "$dir"/*
do
  git_timestamp=$(git log --format="format:%ci" --diff-filter=A -- $filename)
  date=($git_timestamp)
  til_array+=("$date:$filename")
done

sorted_array=($(printf "%s\n" "${til_array[@]}" | sort -r -k1,1 -t':'))

for element in "${sorted_array[@]}"; do
    IFS=: read date filename <<< "$element"
    title=$(head -n 1 $filename | sed 's/# //')
    echo "- $date: [$title](https://github.com/petermekhaeil/til/blob/master/$filename)" >> README.md
done