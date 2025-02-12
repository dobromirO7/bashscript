#!/bin/bash
source ./config.sh

# Переход в целевой каталог
cd $T_D || exit
echo "Текущий каталог: $(pwd)"

# Создание каталога old, если его нет
mkdir -p old


# Перемещение файлов старше 10 дней в каталог old
find . -maxdepth 1 -type f -mtime +10 -exec mv {} old/ \;

# Создание каталогов по первой букве имени файла и перемещение файлов
for file in *; do
    # Проверка, что это файл (не каталог)
    if [ -f "$file" ]; then
        # Получение первой буквы имени файла
        first_letter=$(echo "$file" | cut -c1 | tr '[:upper:]' '[:lower:]')
        
        # Создание каталога, если его нет
        mkdir -p "$first_letter"
        
        # Перемещение файла в соответствующий каталог
        mv "$file" "$first_letter/"
    fi
done


echo "Операция завершена."