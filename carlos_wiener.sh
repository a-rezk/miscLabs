#!/bin/bash

x=3
for i in {1..148}; do
  if (( $i == $x )); then
    echo "wiener"
    (( x += 3 ))
  else
    echo "carlos"
  fi
done