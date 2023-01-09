#!/bin/bash

mkdir -p datasets/txt/
mkdir -p datasets/csv/

for (( i = 1; i < 10; i++ ))
do 
( ./downloader.sh $i 
python converter.py a${i}a ) &
done
wait
echo all files downloaded