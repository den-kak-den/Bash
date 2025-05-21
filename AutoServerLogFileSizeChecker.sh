#!/bin/bash

filename="/storage/data/systemd/log/fluentd/amazon_logs.log"
file_size_limit=10737418240 # 10Gb $((10 * 1024 * 1024 * 1024))

if [ ! -f "$filename" ]; then
  echo "Файл не найден"
  exit 0
fi

filesize=$(stat -c %s "$filename")

if [ "$filesize" -gt $file_size_limit ]; then

        if [ -f "last_size.txt" ]; then
          last_file_size=$(<"last_size.txt") #если файл есть, сравнить значения
            if [ (($filesize - $last_file_size)) -ge 1073741824 ]; then
                echo "$filesize" > "last_size.txt"  # если значение файлсайз больше л>
                echo "Restart please" #стираем ласт сайз и перезаписываем в него файл>
            else
                echo "$filesize" > "last_size.txt" #все равно записываем в файл после>
                echo "OK"
            fi
        else
            echo "$filesize" > "last_size.txt" #если файла нет, создать его и записат>
            echo "Restart please"
        fi
else
  echo "OK"
fi