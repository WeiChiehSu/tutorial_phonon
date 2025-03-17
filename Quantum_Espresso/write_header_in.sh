#!/bin/bash

name=NaCl
# 迴圈遍歷 001 和 002
for i in {001,002}
do
    # 使用 cat 合併 header.in 和 supercell-$i.in，並將結果重定向到 NaCl-$i.in
    cat header.in supercell-$i.in >| $name-$i.in
    echo "Create $name-$i.in Finsh"
done
