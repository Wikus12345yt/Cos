#!/bin/bash

while getopts ":s:f:" opt; do
  case $opt in
    s)
      URL=$OPTARG
      ;;
    f)
      FILENAME=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if [ -z "$URL" ] || [ -z "$FILENAME" ]; then
  echo "Usage: sudo bash skrypt.sh -s <URL> -f <FILENAME>"
  exit 1
fi

curl -s "$URL" > "$FILENAME"
echo "Kod źródłowy strony został zapisany w pliku $FILENAME."
sleep 3
