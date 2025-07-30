#!/bin/bash

x=2
z=1

> new_pass.txt

while IFS= read -r line; do
  echo "$line" >> new_pass.txt
  if (( z == x )); then
    echo "peter" >> new_pass.txt
    (( x += 2 ))
  fi
  (( z += 1 ))
done < pass.txt
