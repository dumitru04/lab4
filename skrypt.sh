#!/bin/bash

case "$1" in
  --date|-d)
    echo "Today's date is: $(date)"
    ;;
  --logs|-l)
    count=100
    if [ -n "$2" ]; then
      count=$2
    fi
    for i in $(seq 1 $count); do
      filename="log${i}.txt"
      echo "Filename: $filename, Script: $0, Date: $(date)" > $filename
    done
    ;;
  --help|-h)
    echo "Available options:"
    echo "--date or -d: Display current date"
    echo "--logs or -l [count]: Create log files"
    echo "--init: Clone repo and set PATH"
    echo "--error or -e [count]: Create error files"
    ;;
  --init)
    git clone https://github.com/dumitru04/lab4
    export PATH=$PATH:$(pwd)/lab4
    ;;
  --error|-e)
    count=100
    if [ -n "$2" ]; then
      count=$2
    fi
    mkdir -p error
    for i in $(seq 1 $count); do
      filename="error/error${i}.txt"
      echo "Filename: $filename, Script: $0, Date: $(date)" > $filename
    done
    ;;
  *)
    echo "Invalid option. Use --help or -h for usage."
    ;;
esac

