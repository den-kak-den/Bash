#!/bin/bash

filename="testfile.mp4"

if [ ! -f "$filename" ]; then
        echo "Файл не найден"
        exit 1
fi

filesize=$(stat -c %s "$filename")

if [ "$filesize" -gt $((10 * 1024 * 1024 * 1024)) ]; then
        echo "Restart please"
else
        echo "OK"
fi