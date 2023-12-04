set -x

gcc -g -O0 -Wall -Wextra -DRAYGUI_IMPLEMENTATION -o ../bin/ballPhysics.exe *.c -I../include -lraylib -lm