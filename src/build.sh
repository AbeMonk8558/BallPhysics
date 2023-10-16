set -x

gcc -g -O0 -Wall -Wextra -o ../bin/ballPhysics.exe *.c -I../include -lraylib -lm