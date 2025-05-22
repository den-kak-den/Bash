#!/bin/bash

echo "ВВЕДИТЕ ИМЯ ФАЙЛА"                # выводим запрос к пользователю, ждем ответа
read filename                           # считываем ответ пользователя
echo "ИМЯ ИСКОМОГО ФАЙЛА: $filename"    # выводим полученный ответ пользователя для контроля

if [ ! -f "$filename" ]; then
        echo "Файл не найден"
        exit 0                          # поскольку нет задачи обрабатывать эту ошибку, делаем экзит 0
fi

echo "ВВЕДИТЕ РАЗМЕР ДЛЯ СРАВНЕНИЯ"             #  в остальном реализуем логику через циклы так же, как в других файлах скрипта
read sizeinsert
echo "PAЗМЕР ДЛЯ СРАВНЕНИЯ: $sizeinsert"


filesize=$(stat -c %s "$filename")

if [ "$filesize" -gt $(($sizeinsert)) ]; then
        echo "Restart please"
else
        echo "OK"
fi