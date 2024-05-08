#!/bin/bash

set -e -x

echo "Use python to interpret compiler"

python3 haex.py main.haex > interpreted.s
yasm -f elf64 -g dwarf2 interpreted.s -o interpreted.o
ld -o interpreted interpreted.o

echo "Compile itself with the new compiler"

./interpreted main.haex > compiled.s
yasm -f elf64 -g dwarf2 compiled.s -o compiled.o
ld -o compiled compiled.o

echo "Just as a sanity check, recompile itself again"

./compiled main.haex > compiled2.s
yasm -f elf64 -g dwarf2 compiled2.s -o compiled2.o
ld -o compiled2 compiled2.o

echo "Compile hello"

./compiled2 hello.haex > hello.s 
yasm -f elf64 -g dwarf2 hello.s -o hello.o
ld -o hello hello.o

echo "Run hello"

./hello
