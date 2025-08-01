#!/usr/bin/bash


lineNumber=1

cat turbo.txt | while IFS= read -r line; do
  echo "\"" >> pyList.txt
  echo $line >> pyList.txt
  echo "\"," >> pyList.txt
  done