#!/bin/bash

filename="/storage/data/systemd/log/fluentd/amazon_logs.log"
file_size_limit=10737418240 # 10Gb $((10 * 1024 * 1024 * 1024))

if [ ! -f "$filename" ]; then
  echo "Файл не найден"
  exit 0
fi

filesize=$(stat -c %s "$filename")

if [ "$filesize" -gt $file_size_limit ]; then #если размер логфайла больше лимита

        if [ -f "last_size.txt" ]; then       #проверяем, проводилась ли ранее проверка и есть ли такой файл
          last_file_size=$(<"last_size.txt")  #если файл есть, записать его размер в файл размера 
            if [ (($filesize - $last_file_size)) -ge 1073741824 ]; then   # если значение файлсайз больше или равно заданному размеру
                echo "$filesize" > "last_size.txt"  #стираем ласт сайз и перезаписываем в него файл
                echo "Restart please"               # даем команду на рестарт сервера
            else
                echo "$filesize" > "last_size.txt" # если размера файла меньше контрольного размера, все равно записываем в файл последний размер файла
                echo "OK"                           # но рестарт не нужен
            fi
        else
            echo "$filesize" > "last_size.txt" #если размер лога больше контрольного, но файла размера нет в директории (первая проверка), создать его и записать в него размер лога
            echo "Restart please"               # даем команду на рестарт сервера       
        fi
else
  echo "OK"                                    #  пока размер логфайла меньше контрольного, рестарты не нужны
fi