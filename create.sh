#!/bin/bash
source ./config.sh

# Переход в целевой каталог
cd $T_D || exit

# Функция для генерации случайного имени
generate_random_name() {
    cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 10 | head -n 1
}

# Создание файлов
for ((i=1; i<=$F_C; i++)); do
    # Генерация случайного имени
    random_name=$(generate_random_name)
    
    # Создание пустого файла без расширения
    touch "$random_name"
    
    echo "Создан файл: $random_name"
done

echo "Создано $F_C файлов в каталоге $T_D."