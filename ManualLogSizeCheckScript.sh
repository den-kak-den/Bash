#!/bin/bash

echo "ВВЕДИТЕ ИМЯ ФАЙЛА"
read filename
echo "ИМЯ ИСКОМОГО ФАЙЛА: $filename"

if [ ! -f "$filename" ]; then
        echo "Файл не найден"
        exit 1
fi

echo "ВВЕДИТЕ РАЗМЕР ДЛЯ СРАВНЕНИЯ"
read sizeinsert
echo "PAЗМЕР ДЛЯ СРАВНЕНИЯ: $sizeinsert"


filesize=$(stat -c %s "$filename")

if [ "$filesize" -gt $(($sizeinsert)) ]; then
        echo "Restart please"
else
        echo "OK"
fi