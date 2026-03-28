#!/bin/bash

#ext_replacement.sh --file test2.sh --extension txt --file test.txt  --replacement sh

EXTENSION=""
REPLACEMENT=""
FILES=()

while [[ $# -gt 0 ]]; do
    case $1 in
        --extension)
            EXTENSION=$2
            shift 2
            ;;
        --replacement)
            REPLACEMENT=$2
            shift 2
            ;;
        --file)
            FILES+=("$2")
            shift 2
            ;;
        *)
            echo "Неизвестный параметр: $1"
            shift
            ;;
    esac
done

if [[ -z "$EXTENSION" || -z "$REPLACEMENT" ]]; then
    echo "Ошибка: необходимо указать --extension и --replacement"
    exit 1
fi

for FILE_NAME in "${FILES[@]}"; do
    if [[ -f "$FILE_NAME" && "$FILE_NAME" == *.$EXTENSION ]]; then
        NEW_NAME="${FILE_NAME%.$EXTENSION}.$REPLACEMENT"
        mv "$FILE_NAME" "$NEW_NAME"
        echo "Переименован: $FILE_NAME -> $NEW_NAME"
    else
        echo "Пропущен: $FILE_NAME"
    fi
done