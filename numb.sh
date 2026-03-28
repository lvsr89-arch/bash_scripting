#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

num=$1

if [ $((num % 2)) -eq 0 ]; then
    middle=$((num / 2))
    sec_half=$((middle + 1))
else
    middle=$(((num - 1) / 2))
    sec_half=$((middle + 2))
fi

mult=1
for ((i=1; i<=middle; i++)); do
    mult=$((mult * i))
done

sum=0
for ((i=sec_half; i<=num; i++)); do
    sum=$((sum + i))
done

echo "mult: $mult"
echo "sum: $sum"