#!/bin/bash

filename="testfile.mp4" 

if [ ! -f "$filename" ]; then       #Если файл не найден, сообщаем об этом
        echo "Файл не найден"
        exit 1
fi

filesize=$(stat -c %s "$filename")  #Если файл найден, присвоить значение его размера переменной

if [ "$filesize" -gt $((10 * 1024 * 1024 * 1024)) ]; then
        echo "Restart please"
else
        echo "OK"
fi