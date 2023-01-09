#!/bin/bash

cd datasets/txt/
if [ ! -f "a${1}a" ]
then
echo "a${1}a is downloading"
wget -nc -q "a${1}a" "https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/binary/a${1}a"
fi
cd ../..
echo "a${1}a downloaded and now is reading"



